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

This has only been known to run on my Macbook and has yet to be
conclusively proven
that it actually does its job of preventing triple beep situations.
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
and has been based on information gathered from a number of web pages.
There is, however, probably one insight:
that (x >> 2)/64.0 is really the same thing as x/256.0;
in other words, the integer part of the temperature reading
is just the MSB of the 16-bit word,
the fractional part being just the LSB divided by 256.

mrtg-getinfo-sensors
--------------------
This Perl script is a wrapper to
[smc(8)](https://github.com/hholtmann/smcFanControl/tree/master/smc-command)
for getting sensor readings for
[MRTG](http://oss.oetiker.ch/mrtg/).
Only some sensors, specifically temperature and fan speed,
are known to work.

This is the first of the three to be written
and has been based on information gathered from a number of web pages.

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


