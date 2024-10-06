#!/bin/bash

PHONEBOOK_ENTRIES="bash_phonebook_entries"


if [ "$#" -lt 1 ]; then
    exit 1

elif [ "$1" = "new" ]; then
    echo "$2, $3" >> "$PHONEBOOK_ENTIRES"

elif [ "$1" = "list" ]; then
    if [ ! -e $PHONEBOOK_ENTRIES ] || [ ! -s $PHONEBOOK_ENTRIES ]; then
    "phonebook is empty"
    else
        while IFS= read -r line; do
		echo "$line"
	done < "$PHONEBOOK_ENTRIES"
    fi

elif [ "$1" = "lookup" ]; then
    while IFS=read -r line; do
	    name=$(echo "$line" | awk '{$NF=""; print $0}')
	    phoneNumber=$(echo "$line" | awk '{print $NF}')

	    if [[ "$name" == *"$2"* ]]; then
		    echo "$phone_number"
	    fi

    done < "$PHONEBOOK_ENTRIES"

elif [ "$1" = "remove" ]; then

	temp_file=$(mktemp)

	if [ -e "$PHONEBOOK_ENTRIES" ] && [ -s "$PHONEBOOK_ENTRIES" ]; then
		while IFS= read -r line; do
			name=$(echo "$line" | awk '{$NF=""; print $0}' | xargs)
	    		
			if [[ "$name" != *"$2"* ]]; then
		    		echo "$line" >> "$temp_file"
	    		fi
		
		done < "$PHONEBOOK_ENTRIES"
		
		mv "$temp_file" "$PHONEBOOK_ENTRIES"

	else
		rm "$temp_file"
	fi


elif [ "$1" = "clear" ]; then
    if [ -e "$PHONEBOOK_ENTRIES" ]; then
	    rm "$PHONEBOOK_ENTRIES"
fi

else
     exit 1
fi
