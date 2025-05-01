# bash-ramdisk
A set of scripts used to make the process of creating a ramdisk in Linux easier to manage.

If you stored your '.bash_aliases' file anywhere other than the directory '~/' run the following command. Do not add '/' at the end of the directory name.

    touch ./bash_location.txt
    echo "~/directory/of/alias" >> ./bash_location.txt


# Installation Instructions
1. Run the 'install.sh' script and follow the instructions.
2. If you don't have any preferences of where to install the scripts, '~/.bin' can be used without adding it to your paths.

# Options
#### ramdisk enable [size] ####
* Creates a ramdisk of specified size

#### ramdisk mkdir [dir_name] ####
* Creates a symlink to a directory located in the ramdisk

#### ramdisk status ####
* Returns status of ramdisk partition
    
#### ramdisk resize [size] ####
* Expands or shrinks the ramdisk partition

#### ramdisk disable ####
* Unmounts ramdisk, removes all symlinks created using 'ramdisk mkdir' and frees data

#### ramdisk help ####
* Returns options

# Scripts
#### ramdisk.sh
* This is the interface script that calls the other scripts.

#### create-ramdisk ####
* Mounts a ramdisk and allocates data to it using tmpfs. Then creates symlinks for ease of access

#### checkstatus-ramdisk ####
* Information about current ramdisks on system

#### mkdir-ramdisk ####
* Creates a directory in the ramdisk and creates a symlink under the current directory. It also keeps track of the created symlinks and cleans up.
* WARNING - It can only create symlinks in the current directory. Use of relative '../' will not work.
* WARNING - The information for created symlinks are on the ramdisk itself. If the PC crashes before 'ramdisk disable' is called, it will be unable to clean up the dead links.

#### resize-ramdisk ####
* Script uses built-in tmpfs to resize the ramdisk

#### remove-ramdisk ####
* Tracks symlinks and deletes them all before unmounting the ramdisk
