FROM python:3.12-slim

WORKDIR /app

COPY pyproject.toml README.md ./
COPY pagewatch_mcp ./pagewatch_mcp

RUN pip install --no-cache-dir .

# stdio by default, which is how desktop clients launch it. Set
# PAGEWATCH_MCP_TRANSPORT=http to serve streamable-http on $PORT instead.
ENTRYPOINT ["pagewatch-mcp"]
