
- [Some sources](#some-sources)
- [Basics](#basics)
- [Good Combo](#good-combo)
- [Combo](#combo)
- [SSH](#ssh)
- [Working on](#working-on)

## Some sources

- http://tmuxcheatsheet.com/
- [another tmux cheatsheet](https://gist.github.com/andreyvit/2921703)
- https://linuxhandbook.com/tmux/
- https://www.youtube.com/watch?v=Yl7NFenTgIo
- [THIS OMG THIS](https://askubuntu.com/questions/850055/ctrl-b-c-n-w-etc-not-working-in-tmux-console)

```bash
# Ctrl-b then ? (meaning Shift-/, ENG keyboard)
<prefix>?
```
## Basics

```bash
-2  force to use 255 colors
# when used -d you detach the current shell from the tmux's session
-d  detach
```
Create session
```bash
tmux new-session -s name
tmux new -s name
```
Kill session
```bash
tmux kill-ses -t name
```
```bash
tmux ls
```
```bash
tmux split-window -h
tmux split-window -v
```
Attach to the session indicated... Just show the session
```bash
tmux attach-session -t mysession
tmux a -t mysession
```

## Good Combo

```bash
cd /home/sam/0ROOT/Github/unicam-sp/unicam.101438.pawn
tmux new -d -s session1 'cd ./backend; node server.js' \; \
split-window 'cd ./frontend; npx react-native start' \; \
split-window 'cd ./frontend; npx react-native run-android'
tmux a
```

## Combo

New session with name s1 and window with name w1
```bash
tmux new -s s1 -n w1
```
Send a command to a panel (Pane) inside the session that you are creating
```bash
tmux new -d -s mysession 'ruby run.rb'
```
```bash
tmux -2u new -n rTorrent -s rtorrent "~/rtorrent/start; exec bash"
```

## SSH

```bash
# ssh alarm@192.168.1.100 -t "LANG=$LANG tmux attach || tmux new"
ssh alarm@192.168.1.100 -t "LANG=$LANG tmux new"
```

## Working on

```bash
cd /home/sam/0ROOT/Github/unicam-sp/unicam.101438.pawn
tmux new-session -d -s api-server 'cd ./backend; node server.js'
tmux new-session -d -s metro-server 'cd ./frontend; npx react-native start'
# run emulator
```