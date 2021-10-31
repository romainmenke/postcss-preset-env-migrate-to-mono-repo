set -e

cd $NEW_REPO_LOCATION

npm pkg set name="@csstools/postcss-preset-env-mono-repo"

npm pkg set engines.node=">=12" --workspaces
npm pkg set license="CC0-1.0" --workspaces
npm pkg set scripts.prepublishOnly="npm run build --if-present && npm run test" --workspaces

npm pkg set private=true
npm pkg set private=true --workspace="@csstools/base-cli"
npm pkg set private=true --workspace="@csstools/postcss-base-plugin-cli"
npm pkg set private=true --workspace="@csstools/postcss-base-plugin"

npm pkg delete scripts.prepublishOnly --workspace="@csstools/base-cli"

