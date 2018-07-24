#!/bin/zsh -f
# Purpose: Show the status of APFS encryptions
# Source: comment at the bottom of <http://osxdaily.com/2017/02/08/view-filevault-progress-mac/>
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2018-07-23

NAME="$0:t:r"

if [ -e "$HOME/.path" ]
then
	source "$HOME/.path"
else
	PATH=/usr/local/scripts:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin
fi

# diskutil apfs list | grep "Encryption Progress"

# diskutil apfs list | fgrep "Encryption Progress" | sed 's#^.*Encryption#Encryption#g;'

RESULT=$(diskutil apfs list | fgrep "Encryption Progress" | sed 's#^.*Encryption Progress: *##g; s#(Unlocked)$##g')

if [[ "$RESULT" == "" ]]
then
	RESULT="FileVault Finished"
fi

echo "FV: $RESULT"

zmodload zsh/datetime

TIME=`strftime "%Y-%m-%d--%H.%M.%S" "$EPOCHSECONDS"`

echo "$TIME: $RESULT" | tee -a "$HOME/Desktop/$NAME.log"

exit 0
#
#EOF
