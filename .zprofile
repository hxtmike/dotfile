
if [[ $(uname) == "Darwin" ]]; then
    # Run the Homebrew shellenv command
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export "C_INCLUDE_PATH=/usr/local/include"
    export "LIBRARY_PATH=/usr/local/lib"
fi
