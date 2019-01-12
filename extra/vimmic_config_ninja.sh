#!/usr/bin/env sh

help() {
   echo "Usage: $0 path/to/compile_commands.json"
   echo
   echo "     This function read a compile_commands.json file"
   echo "     and output includes paths commands for Vimmic"
   echo
   echo "     expl: $0 project/build/compile_commands.json > .vimmic_config"
}

if [[ $# != 1 ]]; then
   help
   exit
fi

compile_commands=$1

# we need to fix a bug in the compile_command.json, when the generator is ninja, relative path are used
# to do so, we replace th .. to . as the .vimmic_config is in the parent folder of the compile_commands.json
# this is only a fix ad will be removed when cmake fixes this stuff

# Extract all -I in one line each and sort them, removing duplicates
cat $compile_commands | sed -e 's/-I\|-isystem/\n\0/g'| sed -n '/^-I\|^-isystem/p'| grep -o '\-I[^ ]*\|-isystem [^ ]*' | sort -u | sed 's/\.\././'

