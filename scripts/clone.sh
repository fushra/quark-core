# This script will download and initialise a copy of gecko and embed quark
# within it ready for use.

####################
# Config variables #
####################

quark_repo="https://github.com/fushra/quark-core"
quark_name="quark"

git_hash_location="config/gecko_dev_revision.txt"
patch_directory="config/patch"

#########
# Logic #
#########

function clone {
    echo "#########################"
    echo "Cloning gecko source code"
    echo "#########################"

    git clone https://github.com/mozilla-dev .

    echo "##################"
    echo "Cloning quark host"
    echo "##################"

    git clone $quark_repo $quark_name
}

function bind_engine {
    echo "#####################"
    echo "Binding gecko version"
    echo "#####################"

    git reset --hard `cat $quark_name/$git_hash_location`
}

clone
bind_engine
