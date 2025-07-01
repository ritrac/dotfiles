#!/bin/bash
set -x
set -e

test -e ~/.xsession && exit

cat << EOF > ~/.xsession
#!/bin/bash

. ~/.bashrc

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

if [ -f /usr/bin/gentoo-pipewire-launcher ]; then
    /usr/bin/gentoo-pipewire-launcher &
fi

if [ -f /usr/bin/xbindkeys ]; then
    /usr/bin/xbindkeys
fi

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval $(ssh-agent -s -t 3600 ) >/dev/null
fi

type i3 && exec i3

EOF
