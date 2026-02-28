if [ "$1" == "-h" ]; then
    echo "meta.sh [file] [title] [artist] <album>
`meta.sh -h` for this page
Missing arguments will be prompted for"
    exit
fi

file=$1
title=$2
artist=$3
album=$4

[[ -z "$file" ]] && read -p "File to change: " file
[[ -z "$title" ]] && read -p "Music title: " title
[[ -z "$artist" ]] && read -p "Music artist: " artist
[[ -z "$album" ]] && read -p "Music album (leave empty if same title): " album

if [[ ! -e "$file" ]]; then
    echo "File doesn't exit"
    exit
fi

ffmpeg -i "$file" -map_metadata -1 -metadata title="$title" -metadata artist="$artist" -metadata album="${album:-$title}" -codec copy "temp-$file"
mv "temp-$file" "$file"
