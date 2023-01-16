/* exec xrandr --dpi 189 */

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

exec i3

exec setxkbmap -model pc104 -layout us,ru -option -option grp:rctrl_toggle,caps:swapescape

exec /usr/bin/xmodmap ~/.Xmodmap

/* /usr/bin/xmodmap /home/oriyia/.Xmodmap */

/* xmodmap ~/.Xmodmap */
/* userresources=$HOME/.Xresources */
/* usermodmap=$HOME/.Xmodmap */
/* sysresources=/usr/X11R6/lib/X11/xinit/.Xresources */
/* sysmodmap=/usr/X11R6/lib/X11/xinit/.Xmodmap */

/* # merge in defaults and keymaps */

/* if [ -f $sysresources ]; then */
/*  xrdb -merge $sysresources */
/* fi */

/* if [ -f $sysmodmap ]; then */
/*  xmodmap $sysmodmap */
/* fi */

/* if [ -f $userresources ]; then */
/*  xrdb -merge $userresources */
/* fi */

/* if [ -f $usermodmap ]; then */
/*  xmodmap $usermodmap */
/* fi */

