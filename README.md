# Migrate to mono repo

## Why

Maintaining `postcss-preset-env` with multiple repositories is prone to errors.
Breaking `postcss-preset-env` from an upstream plugin only becomes visible after the upstream is released. At that point it might already be in use by other users directly.

This quickly becomes a game of Whac-A-Mole.

## How

To migrate to a mono repo we use git patch files.
This repo contains scripts to manage this process as well as all patch files.
This ensures maximum transparency and keeps it reproducible.

There can be no doubt about the integrity of the code in the mono repo after this process.

Use `git diff` in this repo to inspect patch files in between mutation.

## Add more repo's to the migration :

Update these files with new entries :

- `scripts/apply-patches-csstools.sh`
- `scripts/get-patches-csstools.sh`
- `scripts/rewrite-patches-csstools.sh`

- `scripts/apply-patches-jonathantneal.sh`
- `scripts/get-patches-jonathantneal.sh`
- `scripts/rewrite-patches-jonathantneal.sh`

## Start with a clean slate (optional) :

Run `rm -rf ./scripts/patches` and commit this.

In most cases you will not want to do this.
It is more interesting to keep a diff of diffs in between runs.

## Get all patches from listed `csstools` repo's

Inspect `scripts/get-patches.sh` and make sure it does no more or less than you want.

Run : `bash scripts/get-patches-csstools.sh && bash scripts/get-patches-jonathantneal.sh`

## Patch the patches

-  make sure short references to github issues (`#00`) point to the original repository

Inspect `scripts/rewrite-issue-references.js` and make sure it does no more or less than you want.

Run : `bash scripts/rewrite-patches-csstools.sh && bash scripts/rewrite-patches-jonathantneal.sh`

## Apply patches to new mono repo

Inspect `scripts/apply-patches.sh` and make sure it does no more or less than you want.

Run :

```sh
NEW_REPO_LOCATION=<path-to-new-repo-dir> bash ./scripts/apply-patches-csstools.sh
NEW_REPO_LOCATION=<path-to-new-repo-dir> bash ./scripts/apply-patches-jonathantneal.sh
```


## From Single repo to Mono repo

Now all plugins have been moved but the new repo is still a bag of loose parts.

Inspect `scripts/apply-patches-mono-repo.sh` and the patch files in `scripts/mono-repo-patches` and make sure it does no more or less than you want.

Run : `NEW_REPO_LOCATION=<path-to-new-repo-dir> bash scripts/apply-patches-mono-repo.sh`
