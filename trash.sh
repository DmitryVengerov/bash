# #!/usr/bin/bash

# проверка для пустого параметра
if [ -z $* ]
then
echo "Usage: trash.sh [OPTIONS]... [FILE]..."
exit 1
fi

# $0 — имя скрипта (функции) в данном случае это "trash.sh"
# $1 — первый параметр, $2 — второй параметр, $3 — третий параметр и т.д. до 9 включительно
# $* — все параметры, начиная с 1-го
# $@ — то же что и $* ( отличие в том, что если заключить в двойные кавычки то «$*» дает одну строку а «$@» массив строк )
# $# — количество параметров

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
