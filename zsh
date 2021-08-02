## Set up prompt

# TODO: It's possible that this doesn't run correctly on start up?
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed 's/\* //'`
    if [[ -n $BRANCH ]]
    then
        echo "($BRANCH) "
    else
        echo ""
    fi
}

PROMPT="%F{red}%n%f:%F{blue}%~%f `parse_git_branch`$ "

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

## Set up ssh keys

KEYS=(
"id_rsa"
"github_rsa"
)

eval "$(ssh-agent -s)" > /dev/null
for key in $KEYS
do
  ssh-add -K ~/.ssh/${key} 2> /dev/null
done

## Set up rbenv (turned off for the moment)

# eval "$(rbenv init -)"

## Misc settings
#
unsetopt BEEP

## TO DO
# - automatically start ssh-agent
# - automatically load identities into agent
