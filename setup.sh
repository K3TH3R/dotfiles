#!/bin/sh

#######################################
# setup.sh
# This script creates symlinks from the home directory to any desired
# files from the current working directory and then installs the normal
# applications, tap, casks, etc. through Homebrew
#######################################
current_dir=$(pwd)
fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

echo "${current_dir}Brewfile"

echo "\033[0;31m========================================"
echo "\033[0;31m Grab a coffee, this will take a while  "
echo "\033[0;31m========================================"

fancy_echo "Installing formulas and casks from the Brewfile ..."
if brew bundle --file="${current_dir}/Brewfile"; then
  fancy_echo "All formulas and casks were installed successfully."
else
  fancy_echo "Some formulas or casks failed to install."
  echo "This is usually due to one of the Mac apps being already installed,"
  echo "in which case, you can ignore these errors."
fi

echo "\n"
echo "\033[0;31m========================================"
echo "\033[0;31m ALL DONE! WOOT!                        "
echo "\033[0;31m========================================"