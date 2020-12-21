#! /bin/bash

# check if folder exists on Desktop
FILE=~/Desktop/vscportable
DOWNLOAD_URL="https://go.microsoft.com/fwlink/?LinkID=620882"

if [ -d "$FILE" ]; then
    echo "A portable version of VS Code already exist"
else
    echo "Running installation script"
    mkdir $HOME/Desktop/vscportable && cd $HOME/Desktop/vscportable
    CWD=$(pwd)
    
    echo "Downloading VS Code for Mac..."
    # download stable mac version 
    curl -L -# -o vscode-portable.zip $DOWNLOAD_URL
    unzip -q vscode-portable.zip
    rm vscode-portable.zip

    echo "Grabbing project files from Github..." 
    git clone https://github.com/k-morgan22/vscPortableStarter.git --quiet
    mv vscPortableStarter/starter vscPortableStarter/code-portable-data.zip ./
    rm -rf vscPortableStarter

    echo "Installing remote container extension..."
    unzip -q code-portable-data.zip
    rm code-portable-data.zip

    echo "Opening VS Code..."
    # # open starter folder
    open -a $CWD/Visual\ Studio\ Code.app starter/

fi
