#!/bin/sh
# check-plugin.sh — lo que este repo público puede contener.
# Es una allowlist y no una lista de palabras prohibidas: esa lista publicaría justo lo que debe quedar fuera.
set -eu
cd "$(dirname "$0")/.."
ALLOWED='.claude-plugin/marketplace.json
.github/workflows/validate.yml
LICENSE
README.md
plugins/course-rag/.claude-plugin/plugin.json
plugins/course-rag/.mcp.json
plugins/course-rag/skills/search-courses/SKILL.md
tools/check-plugin.sh'
UNEXPECTED=$(git ls-files | LC_ALL=C sort | LC_ALL=C comm -23 - "$(printf '%s\n' "$ALLOWED" | LC_ALL=C sort > .allowed.tmp; echo .allowed.tmp)")
rm -f .allowed.tmp
if [ -n "$UNEXPECTED" ]; then
  echo "Archivos fuera de la allowlist; revísalos antes de agregarlos:" >&2
  echo "$UNEXPECTED" >&2
  exit 1
fi
# Un solo servidor, con la URL exacta y sin headers: la credencial la maneja el OAuth, nunca el repo.
EXPECTED='{"course-rag":{"type":"http","url":"https://vault-mcp-login.boxlab.cloud/mcp"}}'
ACTUAL=$(jq -cS '.mcpServers' plugins/course-rag/.mcp.json)
if [ "$ACTUAL" != "$(printf '%s' "$EXPECTED" | jq -cS .)" ]; then
  echo "plugins/course-rag/.mcp.json cambió; debe apuntar solo a la URL de login" >&2
  exit 1
fi
echo "check-plugin: OK"
