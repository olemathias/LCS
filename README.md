Lan Config System
===
How to setup the master server (main NMS, DHCP and master DNS)
Install mysql-server
Set a good password for mysql

Get the setup script from https://raw.githubusercontent.com/msbone/LCS/master/install_main.sh

After the script have downloaded the files, fill in the settings at config.pm
Then run setup_database.pl It should give you an password. Set that password in db_password in config.pm, remove the root password from the file

The core system is now running, but without data. Start by adding some networks. The easiest way to do that is just use the create_net.pl or creat_net_range.pl

Usage: create_net_range.pl ip_base net_size dhcp name
  Example create_net.pl 213.184.213.0 25 0 Server
  Will create 213.184.213.0/25 with dhcp disabled and the name Server

Usage: create_net_range.pl first_ip_base net_size numer_of_networks dhcp name
  Example: create_net_range.pl 213.184.214.0 25 4 1 DE
  Will create 213.184.214.0/25 213.184.214.128/25 213.184.215.0/25 213.184.215.128/25 with dhcp enabled and the names DE-0 DE-1 DE-2 DE-3

NOTICE, there is still no dhcp running. You will have to run the make_dhcp_config.pl first

See also https://github.com/msbone/dlinkac for dlink auto config