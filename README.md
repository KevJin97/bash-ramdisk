# bash-ramdisk
A set of scripts used to make the process of creating a ramdisk in Linux easier to manage.

If you stored your '.bash_aliases' file anywhere other than the directory '~/' run the following command. Do not add '/' at the end of the directory name.

    touch ./bash_location.txt
    echo "~/directory/of/alias/" >> ./bash_location.txt


# Installation Instructions
Run the 'install.sh' script and follow the instructions.
If you don't have any preferences of where to install the scripts, '~/.bin' can be used without adding it to your paths.

ramdisk enable [size] :
    Creates a ramdisk of specified size
ramdisk mkdir [dir_name] :
    Creates a symlink to a directory located in the ramdisk
ramdisk status :
    Returns status of ramdisk partition
ramdisk resize [size] :
    Expands or shrinks the ramdisk partition
ramdisk disable :
    Unmounts ramdisk, removes all symlinks created using 'ramdisk mkdir' and frees data
ramdisk help :
    Returns options
