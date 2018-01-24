echo "创建测试用账户"
useradd -u 544 -d /home/fetang -g users -m fetang
echo "input you passwd"
#passwd "xy"
echo "add sudo"
vim /etc/sudoers
