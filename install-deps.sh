
#!/usr/bin/env bash
set -euo pipefail

# Run from the repository root
cd "$(dirname "$0")"

# Temporary directory
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Clone dependencies
git clone --depth 1 https://github.com/atcoder/ac-library "$tmp/ac-library"
git clone --depth 1 https://github.com/philip82148/cpp-dump "$tmp/cpp-dump"

# Configure cpp-dump
cat << 'EOF' > "$tmp/cpp-dump/custom-cpp-dump.hpp"
#include "cpp-dump.hpp"
#define dump(...) cpp_dump(__VA_ARGS__)
namespace cp = cpp_dump;
CPP_DUMP_SET_OPTION_GLOBAL(max_line_width, 80);
CPP_DUMP_SET_OPTION_GLOBAL(log_label_func, cp::log_label::filename());
CPP_DUMP_SET_OPTION_GLOBAL(enable_asterisk, true);
EOF

# Install AtCoder Library
rm -rf atcoder
rm -f expander.py
mv "$tmp/ac-library/atcoder" .
mv "$tmp/ac-library/expander.py" .

# Install cpp-dump
rm -rf cpp-dump
mv "$tmp/cpp-dump" .
rm -rf cpp-dump/.git

echo "Dependencies installed successfully."
