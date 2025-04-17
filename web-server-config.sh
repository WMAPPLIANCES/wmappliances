#!/bin/sh
cd build/web
cat > serve.py << 'EOF'
import http.server
import socketserver
import os
import sys
from urllib.parse import urlparse

class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        url_parts = urlparse(self.path)
        request_file_path = url_parts.path
        
        # Serve arquivos estáticos normalmente
        if os.path.exists(self.translate_path(self.path)):
            return http.server.SimpleHTTPRequestHandler.do_GET(self)
        
        # Para qualquer rota não encontrada, servir o index.html
        self.path = '/index.html'
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

PORT = 8080
Handler = MyHttpRequestHandler
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("Serving at port", PORT)
    httpd.serve_forever()
EOF

python3 serve.py
