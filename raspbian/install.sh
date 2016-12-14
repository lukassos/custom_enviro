#!/bin/sh
remove_old_lines
{
        line_start=`cat ~/.bashrc | grep CUSTOM -n | cut -d ":" -f1 | head -1`
	line_end=`cat ~/.bashrc | grep CUSTOM -n | cut -d ":" -f1 | tail -1`
	line_head="`echo "$line_start - 1" | bc`"
	line_count="`wc -l  ~/.bashrc | cut -f1 -d " "`"
	line_tail=`echo "$line_count - $line_end + 1" | bc`
	
	cp ~/.bashrc ~/.bashrc.bak
	head ~/.bashrc -n "$line_head" > ~/.bashrc.new
	tail ~/.bashrc -n "$line_tail" >> ~/.bashrc.new
	#mv ~/.bashrc.new ~/.bashrc
}

check_version
{
	if [ -n "$1"  ]; then 
	if [ -n "$2"  ]; then 
		if [ "$1" != "$2" ]; then 
			remove_old_lines
		fi
	fi
	fi
}


current_version="dgsfasdfsdf"
already_in=`cat ~/.bashrc | grep "CUSTOM ALIASES"`

check_version $already_in $current_version


if [ -z "$already_in" ]; then
	echo "Adding new aliases"
	cat ../install_current/bashrc >> ~/.bashrc
fi

sudo apt-get install colordiff bc

