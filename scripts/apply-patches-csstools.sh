set -e

sh ./scripts/apply-patches.sh postcss-preset-env csstools

sh ./scripts/apply-patches.sh css-blank-pseudo csstools
sh ./scripts/apply-patches.sh css-has-pseudo csstools
sh ./scripts/apply-patches.sh css-prefers-color-scheme csstools
sh ./scripts/apply-patches.sh postcss-color-functional-notation csstools
sh ./scripts/apply-patches.sh postcss-color-mod-function csstools
sh ./scripts/apply-patches.sh postcss-dir-pseudo-class csstools
sh ./scripts/apply-patches.sh postcss-double-position-gradients csstools
sh ./scripts/apply-patches.sh postcss-env-function csstools
sh ./scripts/apply-patches.sh postcss-focus-visible csstools
sh ./scripts/apply-patches.sh postcss-focus-within csstools
sh ./scripts/apply-patches.sh postcss-gap-properties csstools
sh ./scripts/apply-patches.sh postcss-image-set-function csstools
sh ./scripts/apply-patches.sh postcss-lab-function csstools
sh ./scripts/apply-patches.sh postcss-logical csstools
sh ./scripts/apply-patches.sh postcss-nesting csstools
sh ./scripts/apply-patches.sh postcss-overflow-shorthand csstools
sh ./scripts/apply-patches.sh postcss-place csstools
sh ./scripts/apply-patches.sh postcss-pseudo-class-any-link csstools
