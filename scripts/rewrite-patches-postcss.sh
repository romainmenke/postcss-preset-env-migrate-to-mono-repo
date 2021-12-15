set -e

sh ./scripts/rewrite-patches.sh postcss-color-rebeccapurple postcss
sh ./scripts/rewrite-patches.sh postcss-color-hex-alpha postcss
sh ./scripts/rewrite-patches.sh postcss-custom-properties postcss
