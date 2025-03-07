#!/bin/bash

FILE="./queue"
MUSIC_DIR="~/Music"
FORMAT="mp3"

if [[ ! -e $FILE ]]; then
	touch "$FILE"
fi

function controller {
	case "$1" in
		"next"|"prev"|"play"|"pause"|"stop"|"shuffle")
			mpc "$1"
			;;
		*)
			yt-dlp -x --audio-format "$FORMAT" -o "${MUSIC_DIR}/%(title)s.%(ext)s" "$1" --restrict-filenames > /dev/null
			filename=$(yt-dlp --get-filename -o "%(title)s.$FORMAT" "$1" --restrict-filenames)
			mpc update --wait
			mpc add "$filename"
			;;
	esac
}

while true;
do
	if [[ -s $FILE ]]; then
		line=$(head -n 1 $FILE)
		sed -i '1d' $FILE
		controller "$line"
	fi
done


