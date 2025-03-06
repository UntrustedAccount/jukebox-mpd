# Jukebox-MPD

Set of shell scripts used to interface with MPD to play Youtube audio.

## Requirements
- `yt-dlp`
- `mpd`/`mpc`

## Running
- On the host computer with mpd, run `controller.sh` and `host.sh`.
- On the controller computer, run `jb.sh {url}`.
- The audio should eventually be queued to `mpd`, and you should be able to play it with `mpc play` or something.

## Idea
- `jb.sh` connects to `host.sh` and sends the url.
- `host.sh` writes the url to a file.
- `controller.sh` reads lines from the file, downloads/queues the audio.