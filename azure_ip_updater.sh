#! /bin/sh

WAN_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

if [ ! -f ip.txt ]; then
 IP=0
else
 IP=$(cat ip.txt)
fi

if [ "$IP" != "$WAN_IP"  ]; then
 #log in
 az login -u MyAzureUserName -p MyAzurePassword
 #update security rules
 az network nsg rule update --resource-group MyResourceGroupName --nsg-name MyNetworkSecurityGroupName -n MyRuleName --source-address-prefix "$WAN_IP"
 echo "$WAN_IP" > ip.txt
else
 echo "$(date) - IP unchanged" > azure_ip_updater.log
fi