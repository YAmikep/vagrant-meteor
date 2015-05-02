#!/bin/sh

# Run this immediately after 'meteor create <app>' and before attempting
# to run the app with 'meteor'.

# Parameters:
# 	$1 - The name of the app folder created.

# Creates a symlink for <app>/.meteor/local to point to ~/<app>/local.

# Create the local folder in the VM.
mkdir -p ~/$1/local

# Make sure the local folder from the host is removed.
rm -rf $1/.meteor/local

# Setup the link.
ln -s ~/$1/local $1/.meteor/local
