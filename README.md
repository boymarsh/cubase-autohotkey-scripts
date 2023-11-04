# cubase-autohotkey-scripts

There's just one autohotkey script here for now, which works on Cubase, tested on Pro 12 and Pro 13

This is my attempt to handle project and idea management in cubase. Creating multiple cubase projects in the same folder means that the audio subfolder will contain the audio for all those projects. 

The backup process of cubase packages up the current project and the audio for that project only into a separate folder, ensuring correct file references etc. So I can create a bunch of project files for ideas I am developing in one folder (rather than a folder for each) and then use the cubase backup process to package up a project into a separate folder if I think it is worth developing as a full song.

This script simply automates that backup process with a keyboard shortcut so I don't do need to do it manually each time. 

It prompts for the desired name of the subfolder, and then depending on the keypress it places in that subfolder of my projects folder (windows-shift-a) or my ideas folder (windows-shift-x). The script requires that the keyboard shortcut Ctrl-Shift-B is assigned to back up project in Cubase.

Needless to say, there's probably better ways of doing all of this :-)
