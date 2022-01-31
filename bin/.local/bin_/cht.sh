#! /bin/bash

languages=`echo "c cpp rust typescript cmake bash python"|tr ' ' '\n'`

selected=`printf "$languages" | fzf`
read -p "query: " query

if [[ -z $TMUX ]]; then
	curl cht.sh/$selected/`echo $query | tr ' ' '+'`
else
	tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
fi

