
# User specific environment
if [ -d "/usr/local/cuda/bin/" ]; then
    if ! [[ "$PATH" =~ "/usr/local/cuda/bin/" ]]; then
        PATH="/usr/local/cuda/bin/:$PATH"
    fi
fi
