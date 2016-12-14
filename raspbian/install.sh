#!/bin/sh

already_in=`cat ~/.bashrc | grep "CUSTOM ALIASES v1.0"`

if [ -n "$already_in" ]; then
	cat bashrc >> ~/.bashrc
fi

sudo apt-get install colordiff

