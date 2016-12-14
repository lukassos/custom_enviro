#!/bin/sh
remove_old_lines()
{
        line_start=`cat ~/.bashrc | grep CUSTOM -n | cut -d ":" -f1 | head -1`
	line_end=`cat ~/.bashrc | grep CUSTOM -n | cut -d ":" -f1 | tail -1`
	line_head="`echo "$line_start - 1" | bc`"
	line_count="`wc -l  ~/.bashrc | cut -f1 -d " "`"
	line_tail=`echo "$line_count - $line_end " | bc`
	
	cp ~/.bashrc ~/.bashrc.bak
	head ~/.bashrc -n "$line_head" > ~/.bashrc.new
	tail ~/.bashrc -n "$line_tail" >> ~/.bashrc.new
	mv ~/.bashrc.new ~/.bashrc
}

check_version()
{
	if [ -n "$1"  ]; then 
	if [ -n "$2"  ]; then 
		if [ "$1" != "$2" ]; then 
			echo "Removing old aliases"
			remove_old_lines
		fi
	fi
	fi
	echo "Adding new aliases"
	cat ../install_current/bashrc >> ~/.bashrc

}


current_version=`cat ../install_current/bashrc | grep "CUSTOM ALIASES"`
already_in=`cat ~/.bashrc | grep "CUSTOM ALIASES"`
echo "------------"
echo "Current version"
echo $current_version
echo "------------"
echo "New version"
echo $already_in
echo "------------"


check_version $already_in $current_version


sudo apt-get install colordiff bc


wget -c https://download.jetbrains.com/python/pycharm-community-2016.3.1.tar.gz ../install_current/
tar -xvzf ../install_current/pycharm-community-2016.3.1.tar.gz  ~