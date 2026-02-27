if [ "$1" == "-h" ]; then
    echo "meta.sh [file] [title] [artist] <album>
`meta.sh -h` for this page
Missing arguments will be prompted for"
    exit
fi

[[ -z "$1" ]] && read -p "File to change: " $1
[[ -z "$2" ]] && read -p "Music title: " $2
[[ -z "$3" ]] && read -p "Music artist: " $3

if [[ ! -e "$1" ]]; then
    echo "File doesn't exit"
    exit
fi

ffmpeg -i "$1" -map_metadata -1 -metadata title="$2" -metadata artist="$3" -metadata album="${4:-$2}" -codec copy "temp-$1"
mv "temp-$1" "$1"
