#!/bin/bash

# generate the flags
touch /home/jeff/user.txt
echo "flag{ANONYMOUS_FTP_IS_AWESOME}" >> /home/jeff/user.txt

touch /root/root.txt
echo "flag{SUDO_PRIV_ESC_PROBABLY}" >> /root/root.txt

# put files into the ftp folder
touch /var/ftp/information.txt
echo "jeff, you should really change your ssh password. Some hacker could really rock you hard if its not complicated enough." >> /var/ftp/information.txt

# setup privesc
echo 'jeff ALL=(root) /usr/bin/vim /home/jeff/*' | sudo EDITOR='tee -a' visudo

# ftp setup
ANON_ROOT=${ANON_ROOT:-/var/ftp}
MAX_PORT=${MAX_PORT:-65515}
MIN_PORT=${MIN_PORT:-65500}
MAX_PER_IP=${MAX_PER_IP:-2}
MAX_LOGIN_FAILS=${MAX_LOGIN_FAILS:-2}
MAX_CLIENTS=${MAX_CLIENTS:-50}
MAX_RATE=${MAX_RATE:-6250000}
FTPD_BANNER=${FTPD_BANNER:-"Welcome to an awesome public FTP Server"}

[ -f /etc/vsftpd.conf ] || cat <<EOF > /etc/vsftpd.conf
listen=YES
anonymous_enable=YES
dirmessage_enable=YES
use_localtime=YES
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty
write_enable=NO
seccomp_sandbox=NO
xferlog_std_format=NO
log_ftp_protocol=YES
anon_root=${ANON_ROOT}
pasv_max_port=${MAX_PORT}
pasv_min_port=${MIN_PORT}
max_per_ip=${MAX_PER_IP}
max_login_fails=${MAX_LOGIN_FAILS}
max_clients=${MAX_CLIENTS}
anon_max_rate=${MAX_RATE}
ftpd_banner=${FTPD_BANNER}
EOF

/usr/sbin/vsftpd &

# self-deleting script
rm -- "$0"

# make the entrypoint a pass through that then runs the docker command
# https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts#:~:text=exec%20%22%24%40%22%20is%20typically%20used,to%20the%20command%20line%20arguments.
exec "$@"
