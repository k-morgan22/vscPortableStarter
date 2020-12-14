#! /bin/bash

# check if folder exists on Desktop?
FILE=~/Desktop/vscportable
DOWNLOAD_URL="https://go.microsoft.com/fwlink/?LinkID=620882"

if [ -d "$FILE" ]; then
    echo "VS Code & necessary files already exist"
else
    echo "Running installation script"
    mkdir $HOME/Desktop/vscportable && cd $HOME/Desktop/vscportable

    CWD=$(pwd)
    # echo $CWD
    
    echo "Downloading VS Code for Mac..."
    # download stable mac version 
    # curl -O -J -L -# $DOWNLOAD_URL
    curl -L -# -o vscode-portable.zip $DOWNLOAD_URL
    
    # unzip -q VSCode-darwin-stable.zip 
    unzip -q vscode-portable.zip
    
    # rm VSCode-darwin-stable.zip
    rm vscode-portable.zip

    echo "Grabbing project files from Github..." 
    # git clone https://github.com/k-morgan22/vscPortableStarter.git
    git clone https://github.com/k-morgan22/vscPortableStarter.git --quiet
    # mv $CWD/vscPortableStarter/starter $CWD/vscPortableStarter/code-portable-data.zip $CWD
    mv vscPortableStarter/starter vscPortableStarter/code-portable-data.zip ./
    # rm -rf $CWD/vscPortableStarter
    rm -rf vscPortableStarter

    echo "Installing remote container extension..."
    
    # unzip -q $CWD/code-portable-data.zip
    unzip -q code-portable-data.zip

    UNWANTED_FILE=$CWD/__MACOSX
    if [ -d "$UNWANTED_FILE" ]; then
        echo "Cleaning up unnecessary files: $UNWANTED_FILE"
        rm -rf $UNWANTED_FILE
    fi

    # rm $CWD/code-portable-data.zip
    rm code-portable-data.zip

    echo "Opening VS Code..."
    # # open starter folder
    open -n -b "com.microsoft.VSCode" --args "$*"  $CWD/starter/
        

fi



