eval "$(/opt/homebrew/bin/brew shellenv)"

alias bb="/Users/archie/Documents/Shell/bbgit.sh"
alias bb2="/Users/archie/Documents/Shell/bbgit2.sh"

alias SR="/Users/archie/Documents/External/SwiftRewriter/.build/arm64-apple-macosx/release/SwiftRewriter files --colorize"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/opt/homebrew/bin"

# If you need to have qt@5 first in your PATH
export PATH="/usr/local/opt/qt@5/bin:$PATH"
export QT_HOME="/usr/local/Cellar/qt@5/5.15.8_2"
#For compilers to find qt@5 you may need to set:
export LDFLAGS="-L/usr/local/opt/qt@5/lib"
export CPPFLAGS="-I/usr/local/opt/qt@5/include"
#For pkg-config to find qt@5 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/qt@5/lib/pkgconfig"

export JAVA_HOME="/opt/homebrew/opt/openjdk"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include:$CPPFLAGS"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
