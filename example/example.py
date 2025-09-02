import os
import sys

sys.path.append(os.path.dirname(os.path.abspath(__file__)) + '/..')

from html2mu import webpage_to_micron, convert_html_to_micron


if __name__ == '__main__':
    FETCH_URL = True

    if FETCH_URL:
        mu = webpage_to_micron('https://unsigned.io/articles/2025_05_09_The_End_Is_Nigh_For_The_Beta_Days.html')
        print(mu)
        with open('output.mu', 'w', encoding='utf-8') as f:
            f.write(mu)
    else:
        with open('input.html', 'r', encoding='utf-8') as f:
            mu = convert_html_to_micron(f.read(),
                                        current_url='https://unsigned.io/articles/2025_05_09_The_End_Is_Nigh_For_The_Beta_Days.html' # for relative links
                                        )
        print(mu)
        with open('output.mu', 'w', encoding='utf-8') as f:
            f.write(mu)