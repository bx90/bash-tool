git tag archive/$1 $1
git branch -D $1
git branch -d -r origin/$1
git push --tags
git push origin :$1

echo $1 has been archived.
