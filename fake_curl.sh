# /etc/makepkg.conf
# 
# DLAGENTS=('file::/usr/bin/curl -qgC - -o %o %u'
#           'ftp::/usr/bin/axel -n 15 -a -o %o %u'
#           'http::/usr/bin/axel -n 15 -a -o %o %u'
#           'https::/usr/bin/fake_mkpkg.sh %o %u'
#           'rsync::/usr/bin/rsync --no-motd -z %u %o'
#           'scp::/usr/bin/scp -C %u %o')

domin=`echo $2 | cut -f3 -d'/'`;
others=`echo $2 | cut -f4- -d'/'`;
case "$domin" in 
     "github.com")
     url="https://kgithub.com/"$others;
     echo "download from github mirror $url";
     /usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o $1 $url;
     ;;
     *)
     url=$2;
     /usr/bin/axel -n 15 -a -o $1 $url;
     ;;
 esac
