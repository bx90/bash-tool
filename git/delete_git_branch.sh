git branch -D $1
git branch -d -r origin/$1
git push origin :$1

echo Remove is done.
