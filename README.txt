Keep mounted images after restart.

- dbus must be a systemd user service
- cdemu-daemon must be a d-bus activation service

cdemu-autostart is disabled by default. To enable, run as normal user:

	systemctl --user enable dbus-pre
