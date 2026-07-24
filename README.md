# pagewatch-mcp

An MCP server that gives an agent a real browser. Three tools:

- `read_page` turns any url into clean markdown
- `screenshot` returns a png of the rendered page
- `pdf` turns a url or raw html into a pdf

Plus `register` and `balance` for managing your key.

It runs javascript, so it works on pages that a plain http fetch returns empty. It
respects robots.txt and refuses sites that block automation instead of trying to
defeat them.

## No signup

Your first call mints a free trial key and returns real content. There is no form
for your agent to get stuck on. When the trial runs out, one email confirmation by
a human unlocks 200 more free credits, still free.

Billing is metered, but there is no payment processor connected right now, so
nothing is ever charged.

## Install

Run it straight from the repo with [uv](https://docs.astral.sh/uv/):

```json
{
  "mcpServers": {
    "pagewatch": {
      "command": "uvx",
      "args": ["--from", "git+https://github.com/toolshedlabs-hash/pagewatch-mcp", "pagewatch-mcp"]
    }
  }
}
```

Or with pip:

```bash
pip install git+https://github.com/toolshedlabs-hash/pagewatch-mcp
```

```json
{
  "mcpServers": {
    "pagewatch": { "command": "pagewatch-mcp" }
  }
}
```

### Already hosted

If you would rather not run anything, the same tools are live at
`https://pagelens.dev/mcp` as a remote MCP server.

## Configuration

Everything is optional.

| Variable | Default | What it does |
|---|---|---|
| `PAGEWATCH_API_KEY` | none | An existing key. Without one, the first call mints a free trial key and hands it back. |
| `PAGEWATCH_BASE_URL` | `https://pagelens.dev` | Point at a different pagewatch deployment. |
| `PAGEWATCH_MCP_TRANSPORT` | `stdio` | Set to `http` to serve streamable-http on `$PORT` instead. |
| `PAGEWATCH_SOURCE` | `mcp-selfhost` | Attribution tag recorded when a key is registered. |

## What this package does and does not do

It is deliberately thin. Every tool is one https call to a documented `/v1` route
on the pagewatch API. There is no browser, no scraping logic and no credential
store in this package. You can read the whole thing in a couple of minutes and
know exactly what it sends and where.

## Docker

```bash
docker build -t pagewatch-mcp .
docker run --rm -i pagewatch-mcp
```

## License

MIT
