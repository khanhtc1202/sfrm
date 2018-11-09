#!/usr/bin/env bash

# declare questions store & printout question on current time
declare -a __questions=("Are you sure to delete that???"
                "Really???"
                "You can\'t bring it back after this action! Do you still want to delete???"
                "F**kin dangerous thing are coming..."
                "Calm down and think about: what are you going to delete???"
                )
__deep=3


#preexec() {
#    if [[ $1 != *"rm"* ]]; then
#        return
#    fi
#
#
#}


__print_questions() {
    until [ ${__deep} -lt 0 ]; do
        # print question and wait for answer
        i={$RANDOM % ${#a[@]}}
        echo "${__questions[$i]} [y/N]:"
        read ans

        if (( $ans == "n" )) || (( $ans == "N" )); then
            echo "You are safe now!!!"
            exit 0
        fi

        # interval
        let __deep-=1
    done
}

__print_questions

#__print () {
#    print "" $1
#}
#
#autoload -Uz  add-zsh-hook
#
#add-zsh-hook preexec __print
