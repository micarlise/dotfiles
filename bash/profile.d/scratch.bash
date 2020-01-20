
function mk_scratch() {
    local directory=$(mktemp -d)
    mkdir -p $directory
    cd $directory
}
