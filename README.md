This is a collection of random mini utilities that are only related
in their connection to my pursuit of
[triple-beep](http://www.google.com.tw/search?hl=en&biw=1400&bih=889&q=macbook+three+beeps+freeze)
prevention.

Fan and temperature control
===========================

fanspeedd
---------
This Perl script is a daemon that is designed to be run from
init(8),
launchd(8)
or [svscanboot(8)](http://cr.yp.to/daemontools/svscanboot.html)
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

This has only been known to run on my Macbook and seems to only delay
the inevitable triple beep situation.
(The last time it went triple beeping the last logged temperature was 52°C
and the averages were 52.3°C, 52.3°C, 51.6°C —
nowhere even near the setpoint even though the fan was stuck at 6200rpm).
It also only knows how to manipulate one fan.
So YMMV.

This code descended directly from mrtg-get-sensors and fanspeed.

fanspeed
--------
This Perl script is a wrapper to 
[smc(8)](https://github.com/hholtmann/smcFanControl/tree/master/smc-command)
that gets and sets the fan speed (by twiddling F0Tg and FS!).
It only knows about the first fan, if your Mac has more than one.

This is the second of the three to be written
and is really very simple,
as this was based on mrtg-getinfo-sensors
and the only thing that it does which mrtg-getinfo-sensors does not do
is setting the fan speed.

mrtg-getinfo-sensors
--------------------
This Perl script is a wrapper to
[smc(8)](https://github.com/hholtmann/smcFanControl/tree/master/smc-command)
for getting sensor readings for
[MRTG](http://oss.oetiker.ch/mrtg/).
Only some sensors, specifically temperature and fan speed,
are known to work.

This is the first of the three to be written
and has been based on an old set of MRTG scripts I wrote years ago,
heavily supplanted by information gathered from a number of web pages
on making sense out of smc readings
(originally a simple wrapper reading out fan speeds,
it became messy when I attempted to get temperature readings).

One insight into the temperature decoding bit was probably
that (x >> 2)/64.0
(as mentioned in, say,
[here](https://bitbucket.org/elventear/fan-control/src/213fffd400aee245e7db7b5e314497a94ee9dab3/smc.c?at=default)
or
[here](http://mrmekon.tumblr.com/post/18514303388/os-x-current-cpu-temperature-on-command-line))
is really the same thing as x/256.0;
in other words, the integer part of the temperature reading
is just the MSB of the 16-bit word,
the fractional part being just the LSB divided by 256.

Sleep and hibernation
=====================

hibernate
---------
This simple bash script is a wrapper to pmset(8)
that puts the Mac into plain hibernation,
i.e., after dumping core to disk, power is shut off
without the Mac first going through an hour-long sleep state.

Note that hibernation
(whether through this utility or through the normal Sleep command)
might not be safe if the system temperature is too high.
This is yet to be proven
but I really don’t want to go through any more triple beeps.

sleepnow
--------
This simple bash script is a wrapper to pmset(8)
that puts the Mac into sleep
without preparing for a fallback hibernation.

Since this is not a “safe sleep”
obviously there is some risk.
But then obviously there are situations where
writing core to disk is more dangerous than putting the Mac to sleep right away.
The warning about high system temperatures mentioned above
obviously applies as well.


