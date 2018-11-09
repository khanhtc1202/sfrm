#!/usr/bin/env bash

# declare questions store & printout question on current time
declare -a __questions=("Are you sure to delete that???"
                "Really???"
                "You can't bring it back after this action! Do you still want to delete???"
                "F**kin dangerous thing are coming..."
                "Calm down and think about: what are you going to delete???"
                )

# number of questions that will printout when you try to delete something
__deep=3


# exit statement
__exit_on_condition() {
    if [ "$1" = "n" -o "$1" = "N" ]; then
        echo "You are safe now!!!"
        exit 1
    else
        return
    fi
}


# print questions from questions list (max count = deep)
__print_questions() {
    counter=${__deep}
    until [ ${counter} -lt 1 ]; do
        # print question and wait for answer
        index=$(($RANDOM % ${#__questions[@]}))
        echo "${__questions[$index]} [y/N]:"
        read ans

        __exit_on_condition "$ans"

        # interval
        let counter-=1
    done
}


__sfrm() {
    # exit if command was not `rm` command
    if [[ $1 != *"rm"* ]]; then
        return
    fi

    # challenges for deleting
    __print_questions
    return
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec __sfrm
