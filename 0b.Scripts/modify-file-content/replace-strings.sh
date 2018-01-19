

# replace multiline strings recursive in files
find /opt/ownsec/ITSEC-Install-Scripts-ORIG -type f -print0 | xargs -0 perl -i -0pe 's/echo "${bold}\UPDATED\n\${normal}"/g'


# replace pattern recursive
find /opt/ownsec/ITSEC-Install-Scripts-ORIG -type f -print0 | xargs -0 sed -i -e 's/RMBDREX2//g'


# replace string with brackets recurslive
find /opt/ownsec/ITSEC-Install-Scripts-ORIG -type f -print0 | xargs -0sed -i -e 's#dfgsdfgfg6#\[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ]#g'


