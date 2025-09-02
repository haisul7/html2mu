# html2mu

Python library to convert HTML pages from the Internet to Micron format used in Reticulum Network.

Built on [html-to-markdown](https://github.com/Goldziher/html-to-markdown) and [mistune](https://github.com/lepture/mistune) library for custom Markdown parsers (inspired by & forked from [randogoth/md2mu](https://github.com/randogoth/md2mu)) 

> 🚧 WIP 🚧
> 
> Optimized somewhat for simple blog pages like those on HackerNews (news.ycombinator.com), otherwise far from perfect. See Limitations & TODO

Questions, feedback, bug reports: lxmf@ae623c940a36d9215da1893f6a3028bd

### TODO

- [ ] support media as downloadable files
- [ ] get better at filtering out fluff
- [ ] escape bad characters (e.g. random ">" in beginning of the line; links)

## Usage

```bash
uv sync

cd example && uv run python example.py  # example usage in html2mu.py
```

### Limitations

- micron does not support many html elements and styles
