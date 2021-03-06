#!/bin/sh

copy_current_distro()
{
	mkdir ../install_current -pv
	cp -R "$1"/* ../install_current
}

run_current_install()
{
	
	/bin/sh ../install_current/install.sh 
}

cleanup()
{
	rm -rf ../install_current
}


debian_distro=`cat /etc/*-release | grep ^ID= |  cut -d "=" -f2`

if [ -n "$debian_distro" ]; then
	echo "$debian_distro distro setup";
	
	copy_current_distro $debian_distro
	run_current_install
	cleanup
fi
