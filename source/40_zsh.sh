function cd() { builtin cd "$*" && ls; } # Always list directory contents upon 'cd'
unalias rm

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export LSCOLORS=cxfxcxdxbxegedabagacad

function texpdf() {
	ARGUMENT="$1"
	#determine aux name by stripping .tex suffix and adding .aux
	AUXNAME="${ARGUMENT%.tex}.aux"
	FILENAME="${ARGUMENT%.tex}"
	pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" 
	bibtex -terse "$AUXNAME"  
	pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning"
	rm "./$FILENAME.bbl"
	rm "./$FILENAME.aux"
	rm "./$FILENAME.blg"
	rm "./$FILENAME.log"
	rm "./$FILENAME.out"
	rm "./$FILENAME""Notes.bib"
}

[[ -s $(brew --prefix)/etc/autojump.sh  ]] && . $(brew --prefix)/etc/autojump.sh
    
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
