## Gnome

### General Setup
Installed the auto-move-windows extention

Can transfer settings generally with dnconf dump/save. Settings saved as binary db. https://askubuntu.com/questions/984205/how-to-save-gnome-settings-in-a-file

### Other Programs
- neovim
- rofi (need X11)
- unclutter
- numlockx
- fzf
- fd-find
- et
- xclip
- clipmenu (use w/ rofi)

### Keyboard Shortcuts
- `Settings->Keyboard Shortcuts`
- Can write script and set shortcut to run it

### Startup Programs
Can't use .xprofile, which is called by .xinitrc, which in turn is only ran from `startx`

Also can't use .xsession because of X session insanity.

On login thru gdm, /etc/gdm/Xsession is run, which doesn't call any .x* files

So, 

~/.xprofile -> ~/.config/autostart-scripts/autostart-shell.sh 

Then ~/.config/autostart/autostart.desktop calls this script and has
X-GNOME-Autostart-enabled=true, which tells GNOME to run this on startup.

This can also be configured through Tweaks -> Startup Applications

### Themes
- Download themes to `~/.themes`
- Set with `Tweaks->Apperance->Themes`

 
