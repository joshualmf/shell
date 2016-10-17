############################################################
#  git仓库更新到最新的develop分支的代码 
############################################################
function update()
{
	cd ${1}
	echo $1
	git fetch
	git reset
	git checkout develop
	git reset --hard origin/develop
	cd ..
}
ls | while read LINE; do update $LINE; done



