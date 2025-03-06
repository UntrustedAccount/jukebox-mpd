#!/bin/bash

FILE="./queue"
MUSIC_DIR="~/Music"
FORMAT="mp3"

if [[ ! -e $FILE ]]; then
	touch "$FILE"
fi

while true;
do
	if [[ -s $FILE ]]; then
		url=$(head -n 1 $FILE)
		sed -i '' '1d' $FILE
		echo "Downloading ${url}"
		yt-dlp -x --audio-format "$FORMAT" -o "${MUSIC_DIR}/%(title)s.%(ext)s" "$url" --restrict-filenames > /dev/null
		filename=$(yt-dlp --get-filename -o "%(title)s.$FORMAT" "$url" --restrict-filenames)
		echo "Downloaded ${url} to ${filename}"
		mpc add "$filename"
	fi
done
