#!/usr/bin/env bash

set -euo pipefail

# 1) locate the Sumneko lua-language-server binary for macOS
EXT_ROOT="${HOME}/.vscode/extensions"
LUA_LS_BIN="$(find "$EXT_ROOT" -type f -path "*/server/bin/lua-language-server" | head -n1)"
if [[ -z "$LUA_LS_BIN" ]]; then
  echo "❌  Error: lua-language-server not found under $EXT_ROOT"
  exit 1
fi

# 2) parse args / defaults
PROJECT_DIR="${1:-$(pwd)}"
OUTPUT_DIR="${2:-$PROJECT_DIR/Docs}"

echo "📄 Generating docs for project: $PROJECT_DIR"
echo "🔍 Using LuaLS binary at: $LUA_LS_BIN"

# 3) run the language server to emit docs (both JSON + MD)
"$LUA_LS_BIN" --doc="$PROJECT_DIR" --configpath="$PROJECT_DIR/.luarc.json"

# 5) pick out the first Markdown file produced
MD_FILE="$(find "$PROJECT_DIR" -maxdepth 1 -type f -name "*.md" | head -n1)"
if [[ ! -f "$MD_FILE" ]]; then
  echo "❌  Error: no .md file found in $PROJECT_DIR"
  exit 1
fi

# 6a) rename it to InstanceCollectionHelper.md
DEST_FILE="$OUTPUT_DIR/InstanceCollectionHelper.md"
if [[ ! -d "$OUTPUT_DIR" ]]; then
  mkdir "$OUTPUT_DIR"
fi
# 6b) Remove identifying information from MD file
prefix="file:\/\/\/Users\/pranavchary\/Documents\/repos\/"
sed -i ""  -e "s/${prefix}//g" "$MD_FILE"

 # verify and report
if grep -q "${prefix}" "$MD_FILE"; then
  echo "Warning: prefix still present in file."
  return 3
fi

# 6c) Move the MD file to the Docs folder
mv "$MD_FILE" "$DEST_FILE"

echo "✅  Markdown documentation exported to: $DEST_FILE"


# 7) Remove the JSON output
JSON_FILE="$(find "$PROJECT_DIR" -maxdepth 1 -type f -name "doc.json" | head -n1 || true)"
if [[ -n "$JSON_FILE" ]]; then
  rm "$JSON_FILE"
fi

echo "🎉  Done."