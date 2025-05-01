#!/bash/bin

# Set default .bash_aliases directory
if [[ ! -f bash_location.txt ]]; then
	bash_location="~"
else
	bash_location=$(head -n 1 "./bash_location.txt")
fi

# Ask if .bash_aliases should be made
if [[ ! -f $bash_location/.bash_aliases ]]; then
	echo "$bash_location/.bash_aliases does not exist!"
	read -p "Create .bash_aliases in default directory? (y/n): " answer
	
	case "$answer" in
		y|Y ) touch $bash_location/.bash_aliases;;
		n|N ) echo "Installation cancelled" && exit
	esac
fi

# Set where to install the scripts
read -p "Enter directory of where to install ramdisk: " filepath
if [[ ! -d $filepath ]]; then
	echo "Directory '$filepath' does not exist!"
	read -p "Create directory (y/n)?: " answer
	
	case "$answer" in
		y|Y ) mkdir $filepath;;
		n|N ) echo "Installation cancelled"
	esac
fi

# Copy projects
echo "Copying scripts to $filepath"
cp -r ./ramdisk $filepath
chmod +x $filepath/ramdisk/*
echo "Adding 'ramdisk' command to .bash_aliases"
echo "alias ramdisk=\"$filepath/ramdisk/ramdisk.sh\"" >> $bash_location/.bash_aliases

echo -e "\t\033[1;32mSUCCESS\033[0m: Installation complete"
bash ./ramdisk/ramdisk.sh help
