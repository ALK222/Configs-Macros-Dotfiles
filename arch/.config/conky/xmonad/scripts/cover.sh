#!/bin/bash

id_current=$(cat ~/.config/conky/xmonad/current/current.txt)
id_new=`~/.config/conky/xmonad/scripts/id.sh`
cover=
imgurl=

if [ "$id_new" != "$id_current" ]; then

	cover=`ls ~/.config/conky/xmonad/covers | grep $id_new`

	if [ "$cover" == "" ]; then

	    imgurl=`~/.config/conky/xmonad/scripts/imgurl.sh $id_new`
	    wget -q -O ~/.config/conky/xmonad/covers/$id_new.jpg $imgurl &> /dev/null
	    touch ~/.config/conky/xmonad/covers/$id_new.jpg
		
	    rm -f wget-log #wget-logs are accumulated otherwise
	    cover=`ls ~/.config/conky/xmonad/covers | grep $id_new`
		# clean up covers folder, keeping only the latest X amount, in below example it is 10
	    rm -f `ls -t ~/.config/conky/xmonad/covers/* | awk 'NR>1'`
	fi

	if [ "$cover" != "" ]; then
		cp ~/.config/conky/xmonad/covers/$cover ~/.config/conky/xmonad/current/current.jpg
	else
		cp ~/.config/conky/xmonad/empty.jpg ~/.config/conky/xmonad/current/current.jpg
	fi

	echo $id_new > ~/.config/conky/xmonad/current/current.txt
fi
