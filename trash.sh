# #!/usr/bin/bash
if [ -z $* ]
then
echo "Usage: trash.sh [OPTIONS]... [FILE]..."
exit 1
fi

while [ -n "$1" ]
do
case "$1" in
    -l) ls ~/.trash ;;
    -h) echo "Usage: trash.sh [OPTIONS]... [FILE]..."
        echo "Sending a specified FILEs to the /home/%user%/.trash"
        echo "OPTIONS:"
        echo "       -h              display this help and exit"
        echo "       -e              empty trash"
        echo "       -l              list contents"
        echo "       -r FILENAME     restore the specified FILENAME";;
    -e) rm -rf ~/.trash/* ;;
    -r) cp  ~/.trash/$2 ./ && rm ~/.trash/$2 
    -- shift
    break ;;
    *) cp ./$1 ~/.trash/$1  && rm ./$1
    esac    
    shift
done