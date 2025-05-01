if [[ "$1" == status ]]; then
	~/.bin/ramdisk/checkstatus-ramdisk

elif [[ "$1" == enable ]]; then
	~/.bin/ramdisk/create-ramdisk $2

elif [[ "$1" == disable ]]; then
	~/.bin/ramdisk/remove-ramdisk

elif [[ "$1" == mkdir ]]; then
	~/.bin/ramdisk/mkdir-ramdisk $2
elif [[ "$1" == resize ]]; then
	~/.bin/ramdisk/resize-ramdisk $2
elif [[ "$1" == help ]]; then
	echo
	echo -e "[\033[0;37moptions\033[0m] :"
	echo "  status	Shows if ramdisk is enabled/disabled."
	echo "        	if enabled, shows ramdisk properties"
	echo -e "  enable [\033[0;37msize\033[0m]	Allocates a ramdisk of inputted size"
	echo -e "   \033[0;37m↳ size\033[0m	Size must be numerical followed by a unit" 
	echo "       		(eg. M, G)"
	echo "  mkdir		Creates a folder in the ramdisk parition"
	echo "       		and creates a symlink in the current dir"
	echo "  disable	Deallocates the ramdisk and removes "
	echo "         	all symlink references created using"
	echo -e "         	'ramdisk mkdir <\033[0;37mdirectory\033[0m>'"
	echo -e "  resize [\033[0;37msize\033[0m]	Reallocates ramdisk size without losing"
	echo "               	data"
	echo "  help		Displays help menu"
	echo
else
	echo "ramdisk: missing operand"
	echo "Run 'ramdisk help' for more options"
fi
