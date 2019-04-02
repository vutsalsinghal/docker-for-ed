source .bash_profile

echo "
,,  ,, ,,  ,, .,  ,,  ,  ,,  ,, ,,  ,, ,,  ,, .,  ,,  ,  ,,  ,, ,,  ,, ,,  ,,  
,,,  ,, ,,  ,, .,  ,,  ,  ,,  ,, ,,  ,, ,,  ,, .,  ,,  ,  ,,  ,, ,,  ,, ,,  ,   
,  ,,  ,  ,,  ,, ,,  ,, ,  ,  ,,  ,  ,,  ,, ,,  ,, ,,  ,,  ,  ,,  ,  ,,  ,, ,
,,, .,, ,,  ,, .,  .,IIIIIIIIII ,, .,, ,,  ,, .,  ,,  ,  ,,  ,, ,, .,, ,,  ,,  
,,, .,, ,,  ,, .,  IIIIIIIIIII. ,, .,,.,,  ,, .,  ,,..,. .,  ,, ,, .,, ,,  ,,  
,  ,,  ,  ,,  ,, ,IIIIII.,. ,,,.,  ,, .III,,  ,, ,,  ,III,. ,,  ,  ,,  ,  ,,,  
,,, .,, ,,  ,, .,.IIIII,  ,,  ,, ,, .,,III  ,, .,  ,,,III ,,  ,, ,, .,, ,,  ,  
,  ,,  ,  ,,  ,, IIIIII ,,. ,,  , IIIIIIIIIIIII, IIIIIIIIIIIII  ,  ,,  ,  ,,, 
,,, .,, ,,  ,, .,IIIIII,  ,,  ,, ,IIIIIIIIIIIII.,IIIIIIIIIIIII,, ,, .,, ,,  ,  
,  ,,  ,  ,,  ,, IIIIII ,,. ,,  , IIIIIIIIIIIII, IIIIIIIIIIIII  ,  ,,  ,  ,,, 
,,, .,, ,,  ,, .,.IIIII,  ,,  ,, ,, .,,III  ,, .,  ,,,III ,,  ,, ,, .,, ,,  ,  
, .,, ., .,, .,, ,IIIIII,, ., ,.,  ,, .III,, . , ,,. ,III, ., ..  ., .. . , .
,,, .,, ,,  ,, .,  IIIIIIIIIIII, ,, .,, ,.  ,, .,  ,, ., ,,  ,  ,, . , , , ,,
,,,  ,, ,,  ,, .,  , IIIIIIIIII, ,, .,, ,,  ,, .,  ,,  ,  ,,  ,, ,, .,, ,,  ,
,  ,,  ,  ,,  ,, ,,  ,, ,,. ,,  ,  ,,  ,  ,,  ,, ,,  ,, ,,. ,,  ,  ,,  ,  ,,, 
,,, .,, ,,  ,, .,  ,,  ,  ,,  ,, ,, .,, ,,  ,, .,  ,,  ,  ,,  ,, ,, .,, ,,  ,
,,, .,, ,,  ,, .,  ,, .,  ,,  ,, ,, .,, ,,  ,, .,  ,, .,  ,,  ,, ,, .,, ,,  ,"

printf "\n\t\t\e[1;4mWELCOME to \e[95mNYU\e[97m’s \e[34mC++\e[97m CODING ENVIRONMENT\n\n\e[0;1;3;2m"
echo "- Run './run_sample.sh' to run hello world C++ sample."
echo "- Run 'help' for help"
printf "\e[0m\n"
echo "You've the following editors installed:"
echo "- nano"
echo "- vim"
echo "- emacs"
echo
echo "Use '<editor> <filename>' to open a file in an editor."
echo

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_PURPLE="\033[38;5;99m"
COLOR_BLUE="\033[0;38;5;38m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
DIR_BACKGROUND="\033[0;38m\e[43m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    printf "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1="$DIR_BACKGROUND[\W]"                  # basename of pwd
PS1+="\[\$(git_color)\]"                   # colors git status
PS1+=" \$(git_branch)"                     # prints current branch
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "  # '#' for root, else '$'
export PS1
