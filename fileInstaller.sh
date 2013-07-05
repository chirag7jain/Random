#Only For Ubuntu
#Run Through Items In File
function checkFile()
{
	if [ -f $1 ]; then
		if apt-get update 1>/dev/null; then
			echo 'Updating Your Repositories'
			for line in $(cat $1); do
				if $1 == 'dropbox'; then
					$(installDropbox)
				else
					$(install $line)			
				fi
			done;
		else
			echo 'Error Updating'
		fi
	else
		echo 'File Doesnt Not Exist'
	fi
}

#Install Item
function install()
{
	#Check If Package is Already Installed
	if dpkg-query -l $1; then
		echo "$1 already installed"
	else
		if apt-get install $1 -y 1>/dev/null;then
			echo "Installed $1"
		else
			echo "Error Installing $1"
		fi
	fi
}

#Special Case Dropbox
function installDropbox()
{
	url64 = "https://www.dropbox.com/download?plat=lnx.x86_64"
	url32 = "https://www.dropbox.com/download?plat=lnx.x86"
	runDropbox = "~/.dropbox-dist/dropboxd &"
	if $(uname -m | grep '64'); then
		if cd ~ && wget -O - $url64  | tar xzf - 1>/dev/null; then
			runDropbox
		else
			'Error Downloading Dropbox'
		fi
	else
		if cd ~ && wget -O - $url32 | tar xzf - 1>/dev/null; then
			runDropbox
		else
			'Error Downloading Dropbox'
		fi
	fi
}
		

#Check If User Is Root
if [ `whoami` != 'root' ]
then
	echo "You must be root"
	exit
fi

#Get Installation Items File
read -p 'Please Enter Install File Name With Extension': fileName
$(checkFile $fileName)
exit
