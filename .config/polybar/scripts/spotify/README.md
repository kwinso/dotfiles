# Spotify Watcher
This script is written to print currently playing song on spotify.  
It uses Spotify's Web API, so it kinda watches for every device.

# Setup
- Download the [Spotify Tui](https://github.com/Rigellute/spotify-tui#installation).  
- Then, go to `~/.config/spotify-tui/.spotify_token_cache.json` and find `refresh_token` field, copy it.  
- Paste refresh token to `creds.json` file, which is relative to script.
- Also provide `clientId` and `clientSecret` from your [Spotify DashBoard](https://developer.spotify.com/dashboard/) (must be the same as **Spotify Tui** used).
- `npm install` before the run

# Running
If you have ~~big booty~~ wide screen, you can pass your own length of truncation. It's the first parameter for the script
```bash
node spotify.js 120
```

# Polybar config
```ini
[module/spotify]
type = custom/script
format = <label>
format-foreground = ${colors.foreground}
; Allows to run node.js file from everywhere, by default you can run it only in the same dir as the file
exec = /usr/bin/npm run run --silent --prefix /home/mouse/.config/polybar/scripts/spotify 
tail = true
```

# Note
As soon as you see error in the bar, you can check `errros.log` file, script prints there every error, just not to break your bar