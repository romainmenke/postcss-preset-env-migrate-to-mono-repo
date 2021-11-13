set -e

cd $NEW_REPO_LOCATION

volta pin node@16
volta pin npm

npm pkg set name="@csstools/postcss-preset-env-mono-repo"
npm install --save-dev @stryker-mutator/core

npm pkg set engines.node="^12 || ^14 || >=16" --workspaces
npm pkg set license="CC0-1.0" --workspaces
npm pkg set scripts.prepublishOnly="npm run build --if-present && npm run test --if-present" --workspaces
npm pkg set scripts.stryker="stryker run --logLevel error" --workspaces

npm pkg set private=true
npm pkg set private=true --workspace="@csstools/base-cli"
npm pkg set private=true --workspace="@csstools/postcss-base-plugin-cli"
npm pkg set private=true --workspace="@csstools/postcss-base-plugin"

npm pkg delete scripts.pretest:tape --workspaces
npm pkg delete scripts.prepublishOnly --workspace="@csstools/base-cli"
npm pkg delete scripts.stryker --workspace="@csstools/postcss-base-plugin-cli"

