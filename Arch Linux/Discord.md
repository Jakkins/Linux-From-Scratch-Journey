
## Loop your game to a virtual microphone device in PulseAudio

- [Stream audio in Discord](https://www.reddit.com/r/discordapp/comments/f22vz6/guide_how_to_stream_audio_to_discord_on_linux/)

## Commands

Find your mic:
1. open Discord
2. go in a call
3. run this command
```bash
pactl list sources
```
Search for:
```
Source ##[ANY NUMBER]
	State: RUNNING
    Name: [NAME OF MIC]
    ...
    some other things
    ...
    Ports:
		analog-input-mic: Microphone (type: Mic, priority: 8700, availability unknown)
	Active Port: analog-input-mic
```
4. search for audio output
```bash
pactl list sinks
```
```
Source ##[ANY NUMBER]
	State: RUNNING
    Name: [NAME OF OUTPUT]
    ...
    ...
    ...
    Ports:
		analog-output-speaker: Speakers (type: Speaker, priority: 10000, not available)
		analog-output-headphones: Headphones (type: Headphones, priority: 9900, available)
	Active Port: analog-output-headphones
```
5. create bash script
```bash
#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-loopback source=[NAME OF MIC] sink=Virtual1
pactl load-module module-loopback source=Virtual1.monitor sink=[NAME OF OUTPUT]
```
To reset the settings
```bash
systemctl --user restart pulseaudio
```