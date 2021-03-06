# whiplash

whiplash makes your whiptail apparent by mixing up some colors. This project
contains color schemes to alter the default representation of applications
based on Newt such as whiptail.

## Overview

[Newt] is a programming library for color text, widget based user interfaces.
It comes with *whiptail*, a replacement for [dialog]. *whiptail* is used,
among other, as a frontend to Debian APT and its [debconf] tool.

## Examples

Here follows some examples.

### Lamenting

Lamenting is a darker theme with some green and magenta.

[![lamenting gauge](media/lamenting-gauge-thumb.png)](media/lamenting-gauge.png)
[![lamenting checklist](media/lamenting-checklist-thumb.png)](media/lamenting-checklist.png)

### Scorched

Scorched is a dark theme with red.

[![scorched gauge](media/scorched-gauge-thumb.png)](media/scorched-gauge.png)
[![scorched checklist](media/scorched-checklist-thumb.png)](media/scorched-checklist.png)

### default

This is the default for illustrative purposes.

[![default gauge](media/default-gauge-thumb.png)](media/default-gauge.png)
[![default checklist](media/default-checklist-thumb.png)](media/default-checklist.png)

## Usage

Copy the color scheme and setup your environment.

```
git clone https://github.com/op/whiplash ~/.config/whiplash
export NEWT_COLORS_FILE=~/.config/whiplash/lamenting
```

To setup with debconf (select dialog);

```
sudo visudo /etc/sudoers.d/newt
Defaults env_keep += "NEWT_COLORS_FILE"
sudo dpkg-reconfigure debconf
```

If you want to try it out;

```
cd ~/.config/whiplash
NEWT_COLORS_FILE=lamenting ./example/whiptail
NEWT_COLORS_FILE=scorched ./example/msgbox 'No Pasaran'
```

## Background

Had to write this down. My journey with [debconf] frontends.

For months, all dialogs displayed by [debconf] were almost unreadable on my
system. Not sure if the root cause is my X setup, changing to Alacritty or
upgrading to Debian buster.

1. *readline*. This is the classic, but has it changed? Doesn't look familiar.
	 What's up with the underlined text and things? And, where did the default
	 choices go?

2. *Editor*. Tried for a while. Felt annoying.

3. *Dialog*. Colors have changed. Super hard to read. Whatever. Was stuck with
   this for a while until today.

4. *GNOME*. Tried but the default window sizes are full screen. Looks horrible in
	 xmonad unless they are kept in tiled mode. I also don't use a mouse you
	 know, so this adventure was kept short.

5. Tried `apt-cache search debconf` if there's any frontend I've missed. Check
	 `apt-cache show debconf` and finds `whiptail`. This looks familiar!

6. Replace whiptail with readline. Hello 1990. Flashbacks to the days of `make
	 menuconfig`.

7. Skim through `debconf(7)`. Bingo. If you add `libterm-readline-gnu-perl`,
	 you get default values. Wasn't that easy?

8. Decided to look into _whiptail_ again. Bingo. Ends up in [newt.c] from
	 [stackoverflow]. Look at that. Colors can be customised. It uses
	 [SLtt_set_color]. Slang. Documentation is not very helpful.

	 > ??.

9. `NEWT_MONO` is quite nice. However, I ended up with two themes.

PS. I do love debconf. (Just found out that it is being deprecated in favour of
[cdebconf]. Haha!)

[Newt]: https://pagure.io/newt/
[dialog]: http://invisible-island.net/dialog/dialog.html
[newt.c]: https://pagure.io/newt/blob/master/f/newt.c
[stackoverflow]: https://stackoverflow.com/a/46632188
[Sltt_set_color]: http://www.jedsoft.org/slang/doc/html/cref-12.html#ss12.52
[debconf]: https://en.wikipedia.org/wiki/debconf
[cdebconf]: https://packages.debian.org/cdebconf
