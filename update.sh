function update()
{
	if [ -d "${1}" ] ; then
		cd ${1}
		echo $1
		git fetch
		git clean -fd
		git checkout develop
		git reset --hard origin/develop
		cd ..
	fi
}
ls | while read LINE; do update $LINE; done



