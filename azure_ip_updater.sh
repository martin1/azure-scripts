#! /bin/sh

#check internet connection
wget -q --spider http://google.com

if ! [ $? -eq 0 ]; then
 echo "No internet connection, exiting.."
 exit
fi

WAN_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

if [ ! -f ip.txt ]; then
 IP=0
else
 IP=$(cat ip.txt)
fi

if [ "$IP" != "$WAN_IP"  ]; then
 #log in
 /usr/local/bin/az login -u MyAzureUserName -p MyAzurePassword
 #update security rules
 /usr/local/bin/az network nsg rule update --resource-group MyResourceGroupName --nsg-name MyNetworkSecurityGroupName -n MyRuleName --source-address-prefix "$WAN_IP"
 echo "$WAN_IP" > ip.txt
else
 echo "$(date) - IP unchanged"
fi