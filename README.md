# bash-ramdisk
A set of scripts used to make the process of creating a ramdisk in Linux easier to manage.

If you stored your '.bash_aliases' file anywhere other than the directory '~/' run the following command. Do not add '/' at the end of the directory name.

    touch ./bash_location.txt
    echo "~/directory/of/alias" >> ./bash_location.txt


# Installation Instructions
Run the 'install.sh' script and follow the instructions.
If you don't have any preferences of where to install the scripts, '~/.bin' can be used without adding it to your paths.

# Options
Markup : #### ramdisk enable [size] ####
Creates a ramdisk of specified size

Markup : #### ramdisk mkdir [dir_name] ####
Creates a symlink to a directory located in the ramdisk

Markup : #### ramdisk status ####
Returns status of ramdisk partition
    
Markup : #### ramdisk resize [size] ####
Expands or shrinks the ramdisk partition

Markup : #### ramdisk disable ####
Unmounts ramdisk, removes all symlinks created using 'ramdisk mkdir' and frees data

Markup : #### ramdisk help ####
Returns options

# Scripts
Markup : #### ramdisk.sh ####
This is the interface script that calls the other scripts.

Markup : #### create-ramdisk ####
Mounts a ramdisk and allocates data to it using tmpfs. Then creates symlinks for ease of access

Markup : #### checkstatus-ramdisk ####
Information about current ramdisks on system

Markup : #### mkdir-ramdisk ####
Creates a directory in the ramdisk and creates a symlink under the current directory. It also keeps track of the created symlinks and cleans up.
WARNING - It can only create symlinks in the current directory. Use of relative '../' will not work.
WARNING - The information for created symlinks are on the ramdisk itself. If the PC crashes before 'ramdisk disable' is called, it will be unable to clean up the dead links.

Markup : #### resize-ramdisk ####
Script uses built-in tmpfs to resize the ramdisk

Markup : #### remove-ramdisk ####
Tracks symlinks and deletes them all before unmounting the ramdisk
