set -e

# sh ./scripts/apply-patches.sh postcss-preset-env plugin-packs

# sh ./scripts/apply-patches.sh css-blank-pseudo plugins
# sh ./scripts/apply-patches.sh css-has-pseudo plugins
# sh ./scripts/apply-patches.sh css-prefers-color-scheme plugins
# sh ./scripts/apply-patches.sh postcss-color-functional-notation plugins
# sh ./scripts/apply-patches.sh postcss-color-mod-function plugins
# sh ./scripts/apply-patches.sh postcss-dir-pseudo-class plugins
# sh ./scripts/apply-patches.sh postcss-double-position-gradients plugins
# sh ./scripts/apply-patches.sh postcss-env-function plugins
# sh ./scripts/apply-patches.sh postcss-focus-visible plugins
# sh ./scripts/apply-patches.sh postcss-focus-within plugins
# sh ./scripts/apply-patches.sh postcss-gap-properties plugins
# sh ./scripts/apply-patches.sh postcss-image-set-function plugins
# sh ./scripts/apply-patches.sh postcss-lab-function plugins
# sh ./scripts/apply-patches.sh postcss-logical plugins
# sh ./scripts/apply-patches.sh postcss-nesting plugins
# sh ./scripts/apply-patches.sh postcss-overflow-shorthand plugins
# sh ./scripts/apply-patches.sh postcss-place plugins
# sh ./scripts/apply-patches.sh postcss-pseudo-class-any-link plugins
sh ./scripts/apply-patches.sh postcss-tape packages
