# FileVault Status for TextBar

Summary: A TextBar recipe to show FileVault’s encryption progress (for use when first enabling FileVault on your Mac).

## Why would I want this?

Imagine that you have just enabled FileVault on your Mac. Now you might be curious to know how it's progressing. What are you going to do? Are you going to open **System Preferences.app** every few minutes to check its progress? Of course not. And even if you did, all it will give you is a vague (and usually highly-suspect) estimation of the “time remaining”.

Wouldn't it be nicer if you could see the _actual percentage_ of how much of the encryption is complete? Well, you can, but only in **Terminal.app**. But you don't want to have to keep running the same command in Terminal.app over and over either, do you?

It would be much nicer to have the FileVault percentage shown in your Mac's menu bar, along with information telling you if the encryption is paused or not.

That's what you can do with these scripts, and [TextBar for Mac](http://richsomerfield.com/apps/textbar/).

## Installation


1. The file "FileVault Status.textbar" is meant to be imported into TextBar (just double-click on the `.textbar` file to import).

2. The files `check_apfs_encryption.sh` and `check_apfs_encryption-textbar-action.sh` must be:

	-	Installed to /usr/local/scripts/
	-	Made executable

Step #2 can be achieved in Terminal.app by using the following commands:


	sudo mkdir -p /usr/local/scripts/ \
	&& chmod 755 check_apfs_encryption.sh check_apfs_encryption-textbar-action.sh \
	&& sudo mv -vn check_apfs_encryption.sh check_apfs_encryption-textbar-action.sh /usr/local/scripts/

_Note that the `sudo` command will prompt for your account password (assuming you have an "Administrator" account on your Mac)._

## What will it do?

Your menu bar will start to show you the letters "FV" (for "FileVault", of course), followed by a percentage. If the encryption process is “paused” that will word will also appear (as far as I can tell, FileVault is paused automatically when your computer’s CPU is busy.)

When the encryption is completely finished, TextBar will show “FileVault Finished” to let you know it’s done. Then you can disable the script in TextBar.

At any point along the way, you can click on the menu bar text under the FileVault status and open the System Preferences panel for FileVault.

Lastly, the script will create a logfile for you on your desktop, so you can track the progress of FileVault over time, if you want to. See the “example.log” file in this folder to see how it looked when I enabled FileVault on my 12" MacBook.

