#!/bin/bash

# Check Python files for syntax errors

for file in $(git diff --cached --name-only | grep -E '\.py$'):do
    if ! python -m py_compile "$file"; then
        echo "Syntax error in $file"
        exit 1
    fi
done

# Check SQL files for syntax errors using sqlfluff (or any other linter)
for file in $(git diff --cached --name-only | grep -E '\.sql$'); do
    sqlfluff lint "$file" --dialect ansi
    if [ $? -ne 0 ]; then
        echo "SQL syntax error in file: $file"
        exit 1
    fi
done

echo "Pre-commit checks passed."