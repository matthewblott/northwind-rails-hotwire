current_branch=`git rev-parse --abbrev-ref HEAD`
current_tag=`git tag | sort --reverse | head --lines 1`

new_tag=$((current_tag + 1))

git add .
git commit -m "Quick commit"
git checkout main
git merge "${current_branch}" 
git push origin --all
git tag -a "${new_tag}" -m "${new_tag}"
git push origin --tags
git checkout "${current_branch}"
