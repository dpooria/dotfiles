alias vim=nvim
alias p="echo -ne \"\e[6 q\""
# For copy paste
alias c="xclip"
alias c2="xclip -selection clipboard"
alias v="xclip -o"
alias v2="xclip -o -selection clipboard"
# apps
alias paint="terminedia-paint"
alias blender3="/opt/podabb/blender-3.6.15-linux-x64/blender"
#grep
# use rg instead :)
alias rgv="rg --vimgrep"
# grep -A 3 -B 3 -C 3
alias igrep="grep -i"
alias rgrep="grep -r"
alias girl="grep -Irl" # -I -> ignore binary files
alias vgrep="grep -v"
alias esed="sed -E"
# awk '/filter/ {print $}
# awk '!/filter/ {print $1"----"$2}
# git
alias gitc="git commit -m"
alias gitpu="git push"
alias gitpl="git pull"
alias gits="git status"
# tmux
alias tl="tmux ls"
alias ta="tmux attach-session"
# alias notes="bat ~/note.txt"
alias x="chmod +x"
# change keyboard layout
alias dkgr="setxkbmap -layout us,ir,dk,gr -option 'grp:alt_shift_toggle'"
alias usir="setxkbmap -layout us,ir -option 'grp:alt_shift_toggle'"
alias tm="~/.config/i3/toggle_monitor/toggle_monitor.sh"
alias lab="jupyter-lab"
alias svenv=". ./venv/bin/activate"
alias lt="ls -ltrh --color=auto"
alias la="l -altrh --color=auto"
alias xrandedp1="xrandr --output eDP-1 --auto --primary --output HDMI-1 --off"
alias xinternal="xrandr --output eDP-1 --auto --primary --output HDMI-1 --off --output DP-1 --off --output DP-2 --off"
alias open="xdg-open"
alias darkbg="feh --bg-scale /usr/share/backgrounds/default-dark.png"
# from https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias shecan='cp /etc/resolv.conf.shecan /etc/resolv.conf'
alias gemini='/home/podabb/node_modules/.bin/gemini'
alias geminim='/home/podabb/node_modules/.bin/gemini -m gemini-2.5-flash'

# Functions
function vimj() {
    j $1
    if [ $# -eq 1 ]; then
        nvim .
    else
        nvim ${@:2}
    fi
}
# live veiwing of the file with bat
function batf() {
  local filename="$1"
  if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' does not exist."
    return 1
  fi
  local extension="${filename##*.}"
  tail -f "$filename" | bat -l "$extension" --paging=never
}

tre() { command /opt/podabb/tre/target/release/tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }
# sync from niflheim
fromnif() { rsync -av -e ssh sylg.fysik.dtu.dk:/home/energy/podabb/$@ .; }
# sync to niflheim
tonif() { rsync -av -e ssh . sylg.fysik.dtu.dk:/home/energy/podabb/$@; }
# open man pages in vim
viman () { text=$(man "$@") && echo "$text" | vim -R +":set ft=man" - ; }
