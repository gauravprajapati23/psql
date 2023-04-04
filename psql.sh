#!/bin/bash

clear
echo -e "Do you want to Install/Start postgresql."
echo -e "a = Install."
echo -e "b = Start."
echo -e "Enter your choice:"
read choice

clear
echo "Enter the name of your database:"
read name

clear
case $choice in
      a)pkg install postgresql -y
        initdb $PREFIX/postgres
        clear
        pg_ctl -D $PREFIX/postgres -l logfile start
        clear
        echo $(createdb $name);
        psql $name; ;;
      b)clear
        pg_ctl -D $PREFIX/postgres -l logfile start
        echo $(createdb $name);
	clear
        psql $name; ;;
      *)echo -e "Enter valid input \n"
esac
