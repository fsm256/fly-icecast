
# Installing on fly.io

Note: by default, the playlist is on shuffle. If you want to disable it, set `<shuffle>No</shuffle>` in the `ezstream.xml` file

1. Copy your mp3 files to the project's mp3 directory
2. Open a terminal in the project folder and run `flyctl launch --auto-confirm --copy-config --now`
3. Choose a unique app name and the server region
4. After the deploy is finished your stream should be available at https://{appname}.fly.dev

# Updating the playlist

If you've added / removed tracks, do `flyctl deploy` to make the changes available to the server
