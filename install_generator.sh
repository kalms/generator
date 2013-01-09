#! /bin/bash

OPTIONS="Install Quit"
FILENAME=master.tar.gz
PREFFERED_DIR_NAME=vertic
TARGET_DIR=/usr/local/lib/node_modules/yeoman/node_modules/yeoman-generators/lib/generators/
URL=https://github.com/kalms/generator/archive/$FILENAME

select opt in $OPTIONS; do
   if [ "$opt" = "Quit" ]; then
    echo Goodbye.
    exit
   elif [ "$opt" = "Install" ]; then
    echo Downloading from $URL..
    echo
    wget -nv $URL
    echo
    echo -e "\033[33mUnpacking and moving.. \033[0m"
    mkdir $PREFFERED_DIR_NAME && tar xzf $FILENAME -C $PREFFERED_DIR_NAME --strip-components 1
    echo -e "\033[33mCleaning up.. \033[0m"
    rm -rf $FILENAME

    if [ -d "$TARGET_DIR" ]; then
      FULL_DIR=$(pwd)
      mv "$FULL_DIR/$PREFFERED_DIR_NAME" $TARGET_DIR
      echo -e ""
      echo -e "\033[32mDone. Call the scaffold generator like this: yeoman init $PREFFERED_DIR_NAME \033[0m"
      echo -e ""
    else
      # lala
      echo -e "\033[31m Error! $TARGET_DIR doesn't exist. \033[0m"
      rm -rf $PREFFERED_DIR_NAME
    fi
    exit
   else
    clear
    echo -e "\033[31m Error! \033[0m"
    exit
   fi
done