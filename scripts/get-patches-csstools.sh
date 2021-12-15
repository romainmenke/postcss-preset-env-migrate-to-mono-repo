set -e

sh ./scripts/get-patches.sh postcss-preset-env csstools
# sh ./scripts/get-patches-preset-env.sh

sh ./scripts/get-patches.sh css-blank-pseudo csstools
sh ./scripts/get-patches.sh css-has-pseudo csstools
sh ./scripts/get-patches.sh css-prefers-color-scheme csstools
sh ./scripts/get-patches.sh postcss-color-functional-notation csstools
sh ./scripts/get-patches.sh postcss-color-mod-function csstools
sh ./scripts/get-patches.sh postcss-dir-pseudo-class csstools
sh ./scripts/get-patches.sh postcss-double-position-gradients csstools
sh ./scripts/get-patches.sh postcss-env-function csstools
sh ./scripts/get-patches.sh postcss-focus-visible csstools
sh ./scripts/get-patches.sh postcss-focus-within csstools
sh ./scripts/get-patches.sh postcss-gap-properties csstools
sh ./scripts/get-patches.sh postcss-image-set-function csstools
sh ./scripts/get-patches.sh postcss-lab-function csstools
sh ./scripts/get-patches.sh postcss-logical csstools
sh ./scripts/get-patches.sh postcss-nesting csstools
sh ./scripts/get-patches.sh postcss-overflow-shorthand csstools
sh ./scripts/get-patches.sh postcss-place csstools
sh ./scripts/get-patches.sh postcss-pseudo-class-any-link csstools
sh ./scripts/get-patches.sh postcss-tape csstools
