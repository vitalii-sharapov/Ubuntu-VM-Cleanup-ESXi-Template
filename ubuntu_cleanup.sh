#Update the OS
sudo apt -y update
sudo apt -y upgrade

#install packages
apt-get install -y open-vm-tools

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
rm -rf /tmp/*
rm -rf /var/tmp/*

#Clear the SSH
rm -f /etc/ssh/ssh_host_*

#Reset the hostname
cat /dev/null > /etc/hostname

#Remove the default *.yaml file from the /etc/netplan. The VMware customizaion will create it’s own file 99-netcfg-vmware.yaml.
rm -f /etc/netplan/*.yaml

#Reset the machine id
echo -n > /etc/machine-id

#Cleanup apt
apt-get clean

#Clear the history & shutdown the VM
history -c
shutdown -h now