set -e

sh ./scripts/rewrite-patches.sh postcss-preset-env csstools

sh ./scripts/rewrite-patches.sh css-blank-pseudo csstools
sh ./scripts/rewrite-patches.sh css-has-pseudo csstools
sh ./scripts/rewrite-patches.sh css-prefers-color-scheme csstools
sh ./scripts/rewrite-patches.sh postcss-color-functional-notation csstools
sh ./scripts/rewrite-patches.sh postcss-color-mod-function csstools
sh ./scripts/rewrite-patches.sh postcss-dir-pseudo-class csstools
sh ./scripts/rewrite-patches.sh postcss-double-position-gradients csstools
sh ./scripts/rewrite-patches.sh postcss-env-function csstools
sh ./scripts/rewrite-patches.sh postcss-focus-visible csstools
sh ./scripts/rewrite-patches.sh postcss-focus-within csstools
sh ./scripts/rewrite-patches.sh postcss-gap-properties csstools
sh ./scripts/rewrite-patches.sh postcss-image-set-function csstools
sh ./scripts/rewrite-patches.sh postcss-lab-function csstools
sh ./scripts/rewrite-patches.sh postcss-logical csstools
sh ./scripts/rewrite-patches.sh postcss-nesting csstools
sh ./scripts/rewrite-patches.sh postcss-overflow-shorthand csstools
sh ./scripts/rewrite-patches.sh postcss-place csstools
sh ./scripts/rewrite-patches.sh postcss-pseudo-class-any-link csstools
sh ./scripts/rewrite-patches.sh postcss-tape csstools
