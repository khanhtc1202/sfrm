#!/usr/bin/env bats

setup() {
    SFRM_MAX=''
    cp ~/.zshrc "${BATS_TEST_DIRNAME}"
    cat "${BATS_TEST_DIRNAME}/../sfrm_zsh.sh" >> "${BATS_TEST_DIRNAME}/.zshrc"
    source "${BATS_TEST_DIRNAME}/.zshrc"
}

@test "preprocessor ignore in case not rm command typed" {
    __sfrm "ll"
    [[ $status == 0 ]]
}
