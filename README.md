# custom_enviro

I`ve decided not to waste ny more time after installing some linux distro by customizing its environment each time by some other scripts depending on ark or distro. This repository is a central point of my few scripts.  <br>

<b>idea:</b> <br>
setup custom commands and commandline on linux the easy way <br>
 <br>

<b>how to install: </b>  <br>
	1. get git from repos of the linux distro  <br>
		<code>sudo apt-get install gi -y </code><br>
				or <br>
		<code>sudo yum install git -y</code><br> 
		<br>
	2. mkdirs, clone and install : <br>
		<code>mkdir ~/scripts/setup -p && \ </code><br>
		<code>git clone https://github.com/lukassos/custom_enviro.git ~/scripts/setup && \ </code><br>
		<code>exec ~/scripts/setup/install.sh</code><br>
