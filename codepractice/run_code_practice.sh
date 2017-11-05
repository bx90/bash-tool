echo "Given argument $1, I give you..."
PRACTICE_LINK_DIR="/Users/Boxiong/Documents/codepractice/category/"
PRACTICE_LINK_DIR_DAILY="/Users/Boxiong/Documents/codepractice/category/daily"
PRACTICE_FILE=""

case "$1" in
	tree)
        echo "Opening practice for $1 ..."
		PRACTICE_FILE="tree.txt"
	;;
	y|yesterday)
		cp $(ls -t $PRACTICE_LINK_DIR_DAILY/*.html|tail -1) $PRACTICE_LINK_DIR_DAILY/yesterday_practice.html
        tidy -im $PRACTICE_LINK_DIR_DAILY/yesterday_practice.html &> /dev/null 
		cat /Users/Boxiong/Documents/codepractice/category/daily/yesterday_practice.html | grep "\"https:" | tr "\"" " " | tr ">" " "| grep -v "</a" > ~/Documents/codepractice/category/daily/$(date "+%m_%d_%y").txt
        PRACTICE_FILE="daily/$(date "+%m_%d_%y").txt"
	;;
	*)
		echo "Cannot find code practices for the given input $1"
esac

if [ $PRACTICE_FILE ];
then
	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --incognito $(cat $PRACTICE_LINK_DIR$PRACTICE_FILE)
fi
