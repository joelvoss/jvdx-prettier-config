#!/bin/bash

set -e
PATH=./node_modules/.bin:$PATH

format() {
	printf 'Formatting...\n'
	npx prettier --write index.js package.json
}

validate() {
	printf 'Validating config...\n'
	node -e "const config = require('./index.js'); if (config.overrides?.[0]?.options?.parser !== 'json-stringify') process.exit(1)"
}

help() {
	printf 'Usage: %s <command>\n' "$0"
	printf '\nCommands:\n'
	printf '  format    Format source files\n'
	printf '  validate  Run validation\n'
	printf '  help      Show help\n'
}

${@:-help}
