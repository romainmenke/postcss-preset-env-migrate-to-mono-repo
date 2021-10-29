set -e

startdir="$(pwd)"

rm -rf ./scripts/repos/postcss-preset-env
rm -rf ./scripts/patches/postcss-preset-env

cd ./scripts/repos/

git clone https://github.com/csstools/postcss-preset-env.git
cd postcss-preset-env
git checkout next/release

git format-patch --root -o "../../patches/postcss-preset-env"
