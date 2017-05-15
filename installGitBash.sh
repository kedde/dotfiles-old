#!/bin/bash

currentDir=$(pwd)
TOOLSDIR="$currentDir/tools"
BASHDIRECTORY="$TOOLSDIR/bash-git-prompt"
if [ ! -d "$TOOLSDIR" ]; then
	mkdir tools
fi
cd tools
if [ ! -d "$BASHDIRECTORY" ]; then
	git clone https://github.com/magicmonty/bash-git-prompt.git bash-git-prompt --depth=1
else
	echo "git pull latest changes"
	cd $BASHDIRECTORY
	git pull
	cd ..
fi
cd ..
# 
# add to bashrc
echo "updating bashrc"
echo "GIT_PROMPT_ONLY_IN_REPO=1" >> bashrc
echo "source $BASHDIRECTORY/gitprompt.sh"
echo "source $BASHDIRECTORY/gitprompt.sh" >> bashrc

echo "done"
