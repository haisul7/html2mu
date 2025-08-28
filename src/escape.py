EQUALS_ESCAPE = '%3D'

def escape_url(url: str) -> str:
    return url.replace('=', EQUALS_ESCAPE)  # escape '=' in url

def unescape_url(url: str) -> str:
    return url.replace(EQUALS_ESCAPE, '=')  # unescape '=' in url