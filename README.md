# Azure Scripts

Scripts for managing Microsoft Azure resources.

## **azure\_ip_updater.sh**
### What?

Updates an Azure network security group's inbound security rules with the public IP address of the device where the script is executed. Works great with cron. Requires azure-cli

### Why?

Improved security (access restrictions) of Azure resources that are accessed from devices that are behind a router with a dynamic IP address.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
