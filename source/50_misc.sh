export GREP_OPTIONS='--color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# Disable ansible cows }:]
export ANSIBLE_NOCOWS=1

# Disable R to use scientific program
disable r
unalias r
