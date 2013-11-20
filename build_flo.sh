#!/bin/bash

# Make sure we are building clean

make clobber

# Let's sync the source first

repo sync -j16 -f

# Let's setup the environment

. build/envsetup.sh

# Let's pick flo for building

lunch psx_flo-user

# Let's build it

make otapackage -j16

# Let's show a notify-send prompt saying we are down building

notify-send 'All done building!!' --icon=dialog-information 

