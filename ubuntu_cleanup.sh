#Update the OS
sudo apt -y update
sudo apt -y upgrade

#install packages
sudo apt-get install -y open-vm-tools

#Clear audit logs
if [ -f /var/log/audit/audit.log ]; then
    cat /dev/null > /var/log/audit/audit.log
fi
if [ -f /var/log/wtmp ]; then
    cat /dev/null > /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
    cat /dev/null > /var/log/lastlog
fi

#Clear the tmp
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

#Clear the SSH
sudo rm -f /etc/ssh/ssh_host_*

#Reset the hostname
sudo cat /dev/null > /etc/hostname

#Remove the default *.yaml file from the /etc/netplan. The VMware customizaion will create it’s own file 99-netcfg-vmware.yaml.
sudo rm -f /etc/netplan/*.yaml

#Reset the machine id
sudo echo -n > /etc/machine-id

#Cleanup apt
sudo apt-get clean

#Remove cleanup script
sudo rm -rf /home/localadmin/ubuntu_cleanup.sh

#Clear the history & shutdown the VM
sudo history -c
sudo shutdown -h now
