#
# auto generate target file
# 
echo "download the ad domains"
curl -s -o domains.txt https://anti-ad.net/domains.txt


HOSTS_ROS=routeros-hosts

rm -rf routeros-hosts

echo "# date: $(date)" >> $HOSTS_ROS
echo "#  url: https://github.com/vim1024/ad-lists" >> $HOSTS_ROS
echo "# -----------------------------------------" >> $HOSTS_ROS
echo "127.0.0.1  localhost" >> $HOSTS_ROS
echo "127.0.0.1  localhost.localdomain" >> $HOSTS_ROS
echo "127.0.0.1  local" >> $HOSTS_ROS
echo "255.255.255.255  broadcasthost" >> $HOSTS_ROS
echo "::1  localhost" >> $HOSTS_ROS
echo "::1  ip6-localhost" >> $HOSTS_ROS
echo "::1  ip6-loopback" >> $HOSTS_ROS
echo "fe80::1%lo0  localhost" >> $HOSTS_ROS
echo "ff00::0  ip6-localnet" >> $HOSTS_ROS
echo "ff00::0  ip6-mcastprefix" >> $HOSTS_ROS
echo "ff02::1  ip6-allnodes" >> $HOSTS_ROS
echo "ff02::2  ip6-allrouters" >> $HOSTS_ROS
echo "ff02::3  ip6-allhosts" >> $HOSTS_ROS
echo "0.0.0.0  0.0.0.0" >> $HOSTS_ROS
echo "# -----------------------------------------" >> $HOSTS_ROS


while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]*# ]]; then
        continue
    fi
    echo "0.0.0.0  $line" >> $HOSTS_ROS
done < domains.txt


