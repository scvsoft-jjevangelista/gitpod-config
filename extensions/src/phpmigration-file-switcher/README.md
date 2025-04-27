# phpmigration-file-switcher README

This is an internal extension "phpmigration-file-switcher". 

## Features

Add a new command to switch between the Hack and PHP transpiled file.
Just click cmd+shift+p and write "phpmigration".
It works in both directions. From Hack to PHP and PHP to Hack.
It will try to open the other file in the same word your cursor is at. So is better to position your cursor on a function name or some relevant code to easily get to the code on the other file.

Tip:
It cannot send you to the same line you were on the other file, so to make it easy to find the code


## Extension Settings

N/A

## Known Issues

Directories are fixed, so it only works for files that are transpiled under `php\build` directory.

## Release Notes

### 0.0.1

Initial release.

### 0.0.2

Add ExtensionKind.

### 0.0.3

Try to open the related file in the same place you were. (It just select the word under the cursor, so it's more or less accurate)
Readme cleanup.
