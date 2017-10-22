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
