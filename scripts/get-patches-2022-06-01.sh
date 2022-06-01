set -e

sh ./scripts/get-patches.sh postcss-selector-not csstools
sh ./scripts/get-patches.sh postcss-attribute-case-insensitive csstools
sh ./scripts/get-patches.sh postcss-custom-selectors csstools
sh ./scripts/get-patches.sh postcss-custom-media csstools
