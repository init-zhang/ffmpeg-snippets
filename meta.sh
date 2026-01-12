ffmpeg -i "$1" -map_metadata -1 -metadata title="$2" -metadata artist="$3" -metadata album="${4:-$2}" -codec copy "temp-$1"
mv "temp-$1" "$1"
