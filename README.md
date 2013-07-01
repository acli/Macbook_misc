This is a collection of random mini utilities that are only related
in their connection to my pursuit of triple-beep prevention.

Fan and temperature control
===========================

fanspeedd
---------
This is daemon that is designed to be run from init, launchd or svscanboot
that monitors the system temperature and dynamically adjusts the fan
speed to prevent overheating.
[smc(8)](https://github.com/hholtmann/smcFanControl/tree/master/smc-command)
must be installed or
symlinked into /usr/local/sbin for this to work.

The fan speed adjustments work on the assumption that “a noisy computer
is better than an unusable one in the triple-beep state.” So it
features **very aggressive ramp-ups** in fan speed, while ramp-downs are
much more gentle. When temperature exceeds the setpoint, the fan speed
will very quickly be ramped up to the maximum of 6200rpm unless the
temperature drops quickly.

This has only been known to run on my Macbook and has yet to be
conclusively proven
that it actually does its job of preventing triple beep situations. YMMV.

fanspeed
--------
This is a wrapper to 
[smc(8)](https://github.com/hholtmann/smcFanControl/tree/master/smc-command)
that gets and sets the fan speed (by twiddling F0Tg and FS!).
It only knows about the first fan, if your Mac has more than one.

mrtg-getinfo-sensors
--------------------
This is a wrapper to
[smc(8)](https://github.com/hholtmann/smcFanControl/tree/master/smc-command)
for getting sensor readings for
[MRTG](http://oss.oetiker.ch/mrtg/).
Only some sensors, specifically temperature and fan speed,
are known to work.

Sleep and hibernation control
=============================

hibernate
---------
This is a wrapper to pmset(8)
that puts the Mac into plain hibernation,
i.e., power is shut off
without the Mac first going through an hour-long sleep state.

Note that hibernation
(whether through this utility or through the normal Sleep command)
might not be safe if the system temperature is too high.
This is yet to be proven
but I really don’t want to go through any more triple beeps.

sleepnow
--------
This is a wrapper to pmset(8)
that puts the Mac into sleep
without preparing for a fallback hibernation.

Since this is not a “safe sleep”
obviously there is some risk.
But then obviously there are situations where
writing core to disk is more dangerous than putting the Mac to sleep right away.
The warning about high system temperatures mentioned above
obviously applies as well.


