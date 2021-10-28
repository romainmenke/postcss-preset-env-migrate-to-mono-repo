set -e

startdir="$(pwd)"

for f in "$startdir/scripts/patches/$1"/*; do
  # Rewrite github issue references in commit messages
  echo $f | GITHUB_LOCATION=$2/$1 node ./scripts/rewrite-issue-references.js
done
