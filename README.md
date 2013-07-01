This is daemon that is designed to be run from init, launchd or svscanboot
that monitors the system temperature and dynamically adjusts the fan
speed to prevent overheating.
[smc(8)](https://github.com/hholtmann/smcFanControl/tree/master/smc-command)
must be installed or
symlinked into /usr/local/sbin for this to work.

The fan speed adjustments work on the assumption that “a loud computer
is better than an unusable one in the triple-beep state.” So it
features **very aggressive ramp-ups** in fan speed, while ramp-downs are
much more gentle. When temperature exceeds the setpoint, the fan speed
will very quickly be ramped up to the maximum of 6200rpm unless the
temperature drops quickly.

This has only been known to run on my Macbook and has yet to be
conclusively proven
that it actually does its job of preventing triple beep situations. YMMV.
