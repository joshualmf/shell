############################################################
#   将library 目录软链接到每个工程的目录，不用每个子工程都
#   保留一份lib库，便于管理和更新
############################################################

function linklib()
{
	dir_name=$1
	if [ -d "$dir_name" ] ; then
		cd $dir_name
		res=`find . -name "library"`
		if [ -n "$res" ] ; then
			rm -rf library
			ln -s /Users/joshua/project/ip/library library 
		fi
		cd ..
	fi
}

ls | while read LINE; do linklib $LINE; done
