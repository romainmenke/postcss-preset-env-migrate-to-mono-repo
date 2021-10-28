set -e

startdir="$(pwd)"

cd $NEW_REPO_LOCATION

for f in "$startdir/scripts/mono-repo-patches"/*; do
  git am --no-gpg-sign $f
done
