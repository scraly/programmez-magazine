# !/bin/sh
#######################################################################
##
##
## Ce script remplace un mot par un autre mot sur plusieurs fichiers ##
##
##
#######################################################################
FILES=`grep -rl programmez_185 /home/<your_user>/conf /home/<your_user>/bin
/home/<your_user>/local/install/*.crontab`
for i in $FILES
do
echo "replacing programmez_185 by programmez_186 in $i"
sed -r "s:programmez_185:programmez_186:g" $i > $i.new && mv -f $i.new $i
done
