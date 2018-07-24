#!/bin/zsh -f
# Purpose: Take action when the TextBar menu is clicked
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

# Source: https://macdude22.wordpress.com/2015/05/12/adding-filevault-2-unlock-users/
# Don't Indent - BEGIN
/usr/bin/osascript <<EOT
tell application "System Preferences"
	set the current pane to pane id "com.apple.preference.Security"
	get the name of every anchor of pane id "com.apple.preference.Security"
	reveal anchor "FDE" of pane id "com.apple.preference.Security"
	activate
end tell
EOT
# Don't Indent - END

exit 0
#
#EOF
