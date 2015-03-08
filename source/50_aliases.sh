alias mastermind='bash /Users/carlambroselli/Development/Java/Mastermind/mastermind.sh'
alias reams='bash /Users/carlambroselli/Development/Java/REAMS/startGUI.sh'
alias i2b2='bash /Users/carlambroselli/Development/Java/Bachelorprojekt/run.sh'
alias vpntraffic="ssh root@188.166.47.223 'vnstat'"
alias lless="ls | less"

alias editr='umount -f ~/Development/Java/Bachelorprojekt/remote/GIRIScripts 2>/dev/null ; sshfs ubuntu@10.0.0.13:/home/ubuntu/i2b2/GIRIScripts /Users/       carlambroselli/Development/Java/Bachelorprojekt/remote/GIRIScripts && cd /Users/carlambroselli/Development/Java/Bachelorprojekt/remote/GIRIScripts'
alias editgiri='umount -f ~/Development/Java/Bachelorprojekt/remote/GIRIsrc 2>/dev/null ; sshfs ubuntu@10.0.0.13:/home/ubuntu/i2b2/de.erlangen.i2b2.giri/src/ core/de/erlangen/i2b2/giri /Users/carlambroselli/Development/Java/Bachelorprojekt/remote/GIRIsrc && cd /Users/carlambroselli/Development/Java/Bachelorprojekt/remote/GIRIsrc'
alias mmpdf='echo "cd /Users/carlambroselli/Development/Java/Mastermind/extra/business/plan/; pdflatex main.tex && pdflatex main.tex /dev/null && open main.pdf;" | /bin/sh'
alias cdmm='cd /Users/carlambroselli/Development/Java/Mastermind/'
alias cdmmweb="cd /Users/carlambroselli/Development/Java/Mastermind/Web"
alias cdmmtex='cd ~/Development/Java/Mastermind/extra/business/plan/Chapters'

alias mv='mv -iv'                           # Preferred 'mv' implementation
alias vi='vim'
alias c='clear'
alias tmux="TERM=screen-256color-bce tmux"

alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
svgpdf() {
  ~/Development/Python/CairoSVG-1.0.9/cairosvg.py $1 -f pdf > "$1.pdf";
  rm $1;
  rename 's/\.svg//g' $1.pdf 
}
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias vm='mv'

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
