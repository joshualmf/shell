order=""
networksetup -listnetworkserviceorder | grep -i "(Hardware" | awk -F ':' '{print $2}' | awk -F ',' '{print $1}' > tmp 
while read LINE
do
	if [ "${LINE}" != "Wi-Fi" -a "${LINE}" != "Ethernet" ] ; then 
		order=${order}" \"${LINE}\"" 
	fi 
done < tmp 

##### 切换到Wi-Fi
sudo networksetup -ordernetworkservices Wi-Fi Ethernet ${order}

##### 切换到Ethernet
sudo networksetup -ordernetworkservices Ethernet Wi-Fi ${order}

echo $order

