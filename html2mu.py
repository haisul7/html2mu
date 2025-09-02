from copy import deepcopy

import requests as req
from bs4 import BeautifulSoup
from bs4.element import Tag
from html_to_markdown import convert_to_markdown
from mistune import create_markdown

from escape import unescape_url
from .src.micron import MicronRenderer
from .src.underlined import register_underlined_plugin


def wrap_table(*, tag: Tag, text: str, **kwargs):
    tag = deepcopy(tag)  # without this .dismantle() trick modifies the original tag
    if kwargs.get('nested_level', 0) < 0:
        print('TABLE', kwargs.get('nested_level', 0))
        print(tag.attrs)
        print(text[:100])

    # Extract nested tables first
    # nested_tables = tag.find_all('table')
    # nested_table_content = ''
    
    # Remove nested tables from the main table and collect their content
    # for nested_table in nested_tables:
    #     if nested_table != tag:  # Don't remove the main table itself
    #         nested_table_content += '\n' + wrap_table(tag=nested_table, text='', nested=True, **kwargs)
    #         nested_table.decompose()  # Remove from main table

    rows = [child for child in tag.children if isinstance(child, Tag) and child.name == 'tr']
    out = ''
    for row in rows:
        # hackernews specific hacks
        if len([_ for _ in row.children]) == 1:
            row = next(row.children)

        nested_tables = [child for child in row.children if isinstance(child, Tag) and child.name == 'table'] # row.find_all('table')
        # if len(nested_tables) == 1:  # special case: if row is a nested table we append it separately and not nest it
        kwargs['nested_level'] = kwargs.get('nested_level', 0) + 1
        for nested_table in nested_tables:
            out += wrap_table(tag=nested_table, text='', **kwargs) + '\n'
            nested_table.decompose()

        cols = [child for child in row.children if isinstance(child, Tag) and child.name in ('td', 'th')]
        col_texts = [convert_to_markdown(col, convert_as_inline=True) for col in cols]
        col_texts = [col_text for col_text in col_texts if col_text.strip()]
        out += ' | '.join(col_texts) + '\n'

        # escape false sections (> in the beginning of a line)
        out = out.replace('\n>', '\n``>')  # doesn't escape beginning of the text

    return out

def convert_html_to_markdown(html: str) -> str:
    return convert_to_markdown(html, custom_converters={'table': wrap_table})

def convert_markdown_to_micron(md: str, current_url='') -> str:
    m2mu_r = MicronRenderer(current_url=current_url)
    m2mu = create_markdown(renderer=m2mu_r)
    register_underlined_plugin(m2mu)
    result_mu = m2mu(md)
    return result_mu

def convert_html_to_micron(html: str, current_url='') -> str:
    result_md = convert_html_to_markdown(html)
    result_mu = convert_markdown_to_micron(result_md, current_url=current_url)
    return result_mu

def webpage_to_micron(url: str) -> str:
    url = unescape_url(url)
    html = req.get(url).text
    return convert_html_to_micron(html, current_url=url)

if __name__ == '__main__':
    url = 'https://news.ycombinator.com/'
    html = req.get(url).text
    soup = BeautifulSoup(html, 'html.parser')
    # submissions = soup.find_all('table')[2]
    result_md = convert_to_markdown(soup, custom_converters={'table': wrap_table})
    print(result_md)
    print('-----------------------')

    # result_md = '| etet | tete |\n| --- | --- |\n| tete | tete |'
    m2mu_r = MicronRenderer()
    # m2mu_r.register('table', lambda m: print('TABLE', m) or 'table here')
    m2mu = create_markdown(renderer=m2mu_r)
    register_underlined_plugin(m2mu)

    result_mu = m2mu(result_md)
    print(result_mu)