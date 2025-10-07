
# User specific environment
if [ -d "$HOME/.cargo/bin" ]; then
    if ! [[ "$PATH" =~ "$HOME/.cargo/bin" ]]; then
	PATH="$HOME/.cargo/bin:$PATH"
    fi
fi
