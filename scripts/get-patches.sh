set -e

startdir="$(pwd)"

rm -rf ./scripts/repos/$1
rm -rf ./scripts/patches/$1

cd ./scripts/repos/

git clone https://github.com/$2/$1.git
cd $1

git format-patch --root -o "../../patches/$1"
