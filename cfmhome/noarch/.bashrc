# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/bin:$HOME/.local/bin:" ]]; then
	PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi

export PATH

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

