# symlink app if direct symlink doesent work. 
# Some apps need to be executed from within the root dir, so we create a script to jump there for us and run the app - and forward options.


	

# $@ is nearly the same as $*, both meaning "all command line arguments". 
# They are often used to simply pass all arguments to another program (thus forming a wrapper around that other program).

 #The difference between the two syntaxes shows up when you have an argument with spaces in it (e.g.) and put $@ in double quotes:

#wrappedProgram "$@"
# ^^^ this is correct and will hand over all arguments in the way
#     we received them, i. e. as several arguments, each of them
#     containing all the spaces and other uglinesses they have.
# wrappedProgram "$*"
# ^^^ this will hand over exactly one argument, containing all
#     original arguments, separated by single spaces.
# wrappedProgram $*
# ^^^ this will join all arguments by single spaces as well and
#     will then split the string as the shell does on the command
#     line, thus it will split an argument containing spaces into
#     several arguments.


echo '#!/bin/bash
cd /opt/ITSEC/2.Vulnerability-Scanner/proxystrike/sechacking/proxystrike
python proxystrike.py "$@"' > $EXECUTEABLE2

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE3

~$ $EXECUTEABLE3