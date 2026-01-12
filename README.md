# ffmpeg Snippets

Repo for commands and scripts related to ffmpeg

## General Commands

See audio file metadata and stream info:

`ffprobe file`

Convert with new bitrate:

`ffmpeg -i input -b:a <bitrate>k output`

Remove all metadata:

`ffmpeg -i input -map_metadata -1 output`

Copies input to output with reencoding:

`ffmpeg -i input -codec copy output`

Set metadata, option can be repeated:

`ffmpeg -i input -metadata [title|artist|album|...] -codec copy output`

## Files

### meta.sh

`meta.sh file title artist [album]`

Adds title, artist, and album metadata to a music file, also clears existing metadata

Album is set to title if ommited
