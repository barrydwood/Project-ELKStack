#!/bin/bash

title='My Sysinfo Script'
perms=(/etc/shadow /etc/passwd)
users=$(ls /home)
commands=("date" "uname -a" "hostname -s")

if [ $UID -eq 0 ]
then
	echo "Don't run me as root!"
	exit
fi

echo $title - $(date)
for command in ${commands[@]}
do
	echo "The results of the $command command are: " $($command)
done

for perm in ${perms[@]}
do
	echo "Permissions: "
	echo $(ls -l $perm)
done

for user in ${users[@]}
do
	echo "User $user has the following sudo permissions:"
	echo $(sudo -lU $user)
	echo -e "\n"
done

