
# User specific environment
if [ -d "$HOME/go/bin" ]; then
    if ! [[ "$PATH" =~ "$HOME/go/bin" ]]; then
	PATH="$HOME/go/bin:$PATH"
    fi
fi

export GO111MODULE=on
