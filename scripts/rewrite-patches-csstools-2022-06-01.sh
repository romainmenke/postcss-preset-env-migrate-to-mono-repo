set -e

sh ./scripts/rewrite-patches.sh postcss-selector-not plugins
sh ./scripts/rewrite-patches.sh postcss-attribute-case-insensitive plugins
sh ./scripts/rewrite-patches.sh postcss-custom-selectors plugins
sh ./scripts/rewrite-patches.sh postcss-custom-media plugins
