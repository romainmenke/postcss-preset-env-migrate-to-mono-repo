set -e

sh ./scripts/rewrite-patches.sh postcss-selector-not csstools
sh ./scripts/rewrite-patches.sh postcss-attribute-case-insensitive csstools
sh ./scripts/rewrite-patches.sh postcss-custom-selectors csstools
sh ./scripts/rewrite-patches.sh postcss-custom-media csstools
