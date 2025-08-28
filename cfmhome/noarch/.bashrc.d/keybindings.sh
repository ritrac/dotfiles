PRJ_PATH="$HOME/projets:$HOME/nfsHome/projets"

__append_project() {
    file="$(find $HOME/nfsHome/projets/ $HOME/projets/ -mindepth 1 -maxdepth 1 | fzf --scheme=path)"
    if [ -d "${file}" ]; then
	READLINE_LINE="${READLINE_LINE}${file}/"
    else
	READLINE_LINE="${READLINE_LINE}${file} "
    fi
    READLINE_POINT=$(echo "$READLINE_LINE" | wc -c)
}


function list_prj() (
	# space friendly function
	# returns a list with the following format :
	# 	timestamp:/full/project/path/name;name
	# 	timestamp:/full/project/path/name;name[-id]
	function subFind() {
		OIFS=$IFS
		IFS=':' # loop over ':' instead of spaces
		for mdir in $(echo "$PRJ_PATH"); do
			find "$mdir" -mindepth 1 -maxdepth 1 -type d -printf '%Ts:%p\n'
		done
		IFS=$OIFS
	}

	subFind |
	awk --posix '
	# project name conflict disambiguation
	# add a suffix number if name conflict
	{
		n=split($0, f, /\//);
		name=f[n];
		fname=$0;
		# multidimentional array are not posix, so make a list :/
	        b[ name ] = b[ name ] fname ";"
	}
	END {
		for(name in b){
			l=split( b[name], s, /;/);
			for(i=1; i<l; i++){
				if(1==l) {
					print s[i] ";" name
				} else {
					print s[i] ";" name "-" i
				}
			}
		}
	}' |
	sort -nr | cut -d':' -f2- | # remove the timestamp from subFind()
	sed  "s|$PWD/||g" # just get the relative name
)

function prj_menu() {
    list_prj | cut -d\; -f1 | fzf \
        --scheme=path --margin=5%  \
        --preview='fzf-preview.sh {}' \
        --preview-label='[ Preview ]' \
        --preview-label-pos='3:bottom' \
        --input-border \
        --input-label='[ BASHCOMP ]' \
        --input-label-pos='3:bottom'

}

__append_project2() {
    file="$(prj_menu)"

    if [ -d "${file}" ]; then
        file="${file}/"
    fi
    l="${#file}"
    header="${READLINE_LINE:0:$READLINE_POINT}"
    footer="${READLINE_LINE:$READLINE_POINT}"
    READLINE_LINE="${header}${file}${footer}"
    READLINE_POINT="$(( $READLINE_POINT + $l ))"
}

bind -x '"\C-f": "__append_project2"'
bind -x '"\C-bf": "tmux-sessionizer"'

# Shift TAB
__fzf_complete_recursive() {
    if [ -n "$1" ]; then
        depth=$1
    else
        depth=1
    fi

    local file="$(find -L $2 -mindepth 1 -maxdepth $depth | fzf --scheme=path)"

    if [ -z "$file" ]; then
        echo $2
        return
    fi

    if [ -d "$file" -o -L "$file" ]; then
        depth="$(( x + 1 ))"
        file="$(__fzf_complete_recursive $depth "$file/")"
    else
        file="${file} "
    fi
    echo "$file"
}
__fzf_complete() {
    file="$(__fzf_complete_recursive 1)"
    READLINE_LINE="${READLINE_LINE}${file}"
    READLINE_POINT=$(echo "$READLINE_LINE"| wc -c)
}
bind -x '"\e[Z": "__fzf_complete"'
