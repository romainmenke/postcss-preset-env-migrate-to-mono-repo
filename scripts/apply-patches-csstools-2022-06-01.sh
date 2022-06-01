set -e

sh ./scripts/apply-patches.sh postcss-selector-not plugins
sh ./scripts/apply-patches.sh postcss-attribute-case-insensitive plugins
sh ./scripts/apply-patches.sh postcss-custom-selectors plugins
sh ./scripts/apply-patches.sh postcss-custom-media plugins
