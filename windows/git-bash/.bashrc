function peco-src() {
    local src=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$src" ]; then
        if [ -t 1 ]; then
            echo ${src}
            cd ${src}
        fi
    fi
}
bind -x '"\C-]": peco-src'

function peco_search_history() {
    local src=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$src"
    READLINE_POINT=${#src}
}
bind -x '"\C-h": peco_search_history'
