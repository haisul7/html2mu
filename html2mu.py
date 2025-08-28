import requests as req
from bs4 import BeautifulSoup
from bs4.element import Tag
from html_to_markdown import convert_to_markdown
from mistune import create_markdown

from .src.micron import MicronRenderer
from .src.underlined import register_underlined_plugin


def wrap_table(*, tag: Tag, text: str, **kwargs):
    # if not kwargs.get('nested', False):
    #     print('TABLE')
    #     print(tag.attrs)
    #     print(text[:100])

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
        nested_tables = row.find_all('table')
        if len(nested_tables) == 1:  # special case: if row is a nested table we append it separately and not nest it
            out += wrap_table(tag=nested_tables[0], text='', nested=True, **kwargs) + '\n'
            nested_tables[0].decompose()
            # continue

        cols = [child for child in row.children if isinstance(child, Tag) and child.name in ('td', 'th')]
        col_texts = [convert_to_markdown(col, convert_as_inline=True) for col in cols]
        col_texts = [col_text for col_text in col_texts if col_text.strip()]
        out += ' | '.join(col_texts) + '\n'

    # Append flattened nested tables after main table
    # out += nested_table_content

    return out

def convert_html_to_markdown(html: str) -> str:
    return convert_to_markdown(html, custom_converters={'table': wrap_table})

def convert_markdown_to_micron(md: str) -> str:
    m2mu_r = MicronRenderer()
    m2mu = create_markdown(renderer=m2mu_r)
    register_underlined_plugin(m2mu)
    result_mu = m2mu(md)
    return result_mu

def convert_html_to_micron(html: str) -> str:
    result_md = convert_html_to_markdown(html)
    result_mu = convert_markdown_to_micron(result_md)
    return result_mu

def webpage_to_micron(url: str) -> str:
    html = req.get(url).text
    return convert_html_to_micron(html)

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