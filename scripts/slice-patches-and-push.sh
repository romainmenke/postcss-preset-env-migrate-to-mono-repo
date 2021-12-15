#!/bin/sh

set -e

git checkout main
git pull

echo "slicing change \"$1\" per plugin from \"plugins\" into \"monorepo-migration\""

for d in plugins/*/ ; do
	plugin="$(basename $d)"
	echo "slicing : $plugin"

	branch_name="$plugin--monorepo-migration--$(rnd-name)"

	git checkout plugins-b
	git reset HEAD^
	git checkout -b "$branch_name"

	if git add $d; then
		echo "added changes for : $plugin"
	else
		echo "nothing changed for : $plugin"
		continue
	fi

	if git commit -m "$plugin : monorepo migration" --no-verify; then
		echo "committed changes for : $plugin"
	else
		echo "nothing committed for : $plugin"
		continue
	fi

	git push --set-upstream origin "$branch_name"

	git checkout plugins-b
	git add .
	git commit -m "wip" --no-verify
done
