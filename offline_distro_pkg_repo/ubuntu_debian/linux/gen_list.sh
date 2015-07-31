#!/bin/sh

# user configurations
MIRROR=http://archive.ubuntu.com/ubuntu
LOCAL=file:///opt/ubuntu_offline_repo

# tmp and final package download list
TMP=apt_list_tmp
LIST=apt_list

if [[ $# == 0 ]]; then
	echo "what packages to install"
        echo "usage $0 <package_list/package_list_file>"
	exit -1
fi

package_list=
# handle the package_list_file case
if [[ ($# == 1) && (-f $1) ]]; then
    package_list=$(cat $1 | xargs)
else
    package_list=$*
fi

apt-get -qq --print-uris install $package_list > $TMP
wc $TMP

# truncate unnecessary details
awk '{gsub("\x27", "", $0); print $1}' < $TMP > $LIST 
wc $LIST
rm -rf $TMP

sed -i "s|$LOCAL|$MIRROR|g" $LIST
