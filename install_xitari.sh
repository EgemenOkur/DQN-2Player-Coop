#!/usr/bin/env bash

reposrc=git@github.com:choo8/Xitari2Player.git
localrepo=Xitari2Player
localrepo_vc_dir=$localrepo/.git

# Build and install Python interface for Xitari
if [! -d $localrepo_vc_dir]
then
	echo "Cloning Github repo"
	git clone $reposrc
else
	echo "Pulling from Github repo"
	cd $localrepo
	git pull $reposrc
fi

# Compile source code
echo "Compiling source code for Xitari2Player"
cd Xitari2Player
cmake .
make install

# Install python module
echo "Installing python module"
pip install . --upgrade
