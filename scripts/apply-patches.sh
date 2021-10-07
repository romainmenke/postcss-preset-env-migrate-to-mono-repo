set -e

startdir="$(pwd)"

cd $NEW_REPO_LOCATION

for f in "$startdir/scripts/patches/$1"/*; do
  echo $f
  git am --no-gpg-sign --directory="plugins/$1" $f
done
