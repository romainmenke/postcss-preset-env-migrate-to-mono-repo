set -e

startdir="$(pwd)"

cd $NEW_REPO_LOCATION

for f in "$startdir/scripts/patches/$1"/*; do
  git am -3 --no-gpg-sign --directory="$2/$1" $f
done
