#
# auto generate target file
# 
echo "download the ad domains"
curl -s -o domains.txt https://anti-ad.net/domains.txt

rm -rf routeros-hosts.txt

while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]*# ]]; then
        continue
    fi
    echo "0.0.0.0  $line" >> routeros-hosts.txt
done < domains.txt


