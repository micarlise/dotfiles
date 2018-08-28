


# Access to original git diff tool
function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}


# Change directory to root of git directory
function groot() {
    cd $(git rev-parse --show-toplevel)
}

