def app(environ, start_response):
    data = '\n'.join(environ['QUERY_STRING'].split('&'))
    start_response("200 OK", [
        ("Content-Type", "text/plain"),
        ("Content-Length", str(len(data)))
    ])
    return iter([data.encode()])
