This is daemon that is designed to be run from inittab or svscanboot
that monitors the system temperature and dynamically adjusts the fan
speed to prevent overheating. The smc utility must be installed or
symlinked into /usr/local/sbin for this to work.

This has only been known to run on my Macbook and has yet to be proven
that it actually does it job of preventing triple beep situations. YMMV.
