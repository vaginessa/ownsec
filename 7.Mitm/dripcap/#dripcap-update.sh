#does not work - node problem

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  ___ ____   ____    _    ____  
|  _ \|  _ \|_ _|  _ \ / ___|  / \  |  _ \ 
| | | | |_) || || |_) | |     / _ \ | |_) |
| |_| |  _ < | ||  __/| |___ / ___ \|  __/ 
|____/|_| \_\___|_|    \____/_/   \_\_|    
             
${normal}"

GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/dripcap/dripcap
cd /opt/ITSEC/7.Mitm/dripcap/dripcap
git clone https://github.com/dripcap/dripcap.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

fi