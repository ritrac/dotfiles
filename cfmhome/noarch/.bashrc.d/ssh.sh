
if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval $(ssh-agent -s -t 3600 ) >/dev/null
fi

