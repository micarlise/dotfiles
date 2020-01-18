
function addpathf {
    # Add path segment to front of PATH like variable

    declare -n REFPATH=$1
    shift

    for x in ${1//:/ }; do
		case ":$REFREFPATH:" in
            *":${x}:"*) ;; # already in REFPATH
			*) REFPATH="${x}:$REFPATH" ;;
		esac
	done
    unset x 
}

function addpathr {
    # Add path segment to end of PATH like variable
    declare -n REFPATH=$1
    shift

    for x in ${1//:/ }; do
		case ":$REFPATH:" in
            *":${x}:"*) ;; # already in REFPATH
            *) REFPATH="${REFPATH%:}:${x%:}" ;;
		esac
	done
    unset x 
}

function removepath {
    # remove path segment from PATH like variable

    declare -n REFPATH=$1
    shift

    if [ -n "${REFPATH}" ]; then
        local segments=(${REFPATH//:/ })

        local entries=()
        for ((i="${#segments[@]}"-1;i>=0;i--)); do
            entries+=("${segments[i]}");
        done

        REFPATH=
        for entry in "${entries[@]}"; do
            case ":${1}:" in
                *":${entry}:"*) ;; # entry labeled for removal
                *) REFPATH=${entry}:$REFPATH ;; # add everything else
            esac
        done
        REFPATH=${REFPATH%:} 
        unset entry 
    fi
}

function cleanpath {
    # remove duplicates from PATH like variable

    declare -n REFPATH=$1
    shift

	if [ -n "${REFPATH}" ]; then
        local segments=(${REFPATH//:/ }) 

        local entries=()
        for ((i="${#segments[@]}"-1;i>=0;i--)); do
            entries+=("${segments[i]}");
        done

        REFPATH=
        for entry in "${entries[@]}"; do
            case ":$REFPATH:" in
                *":${entry}:"*) ;;
                *) REFPATH=${entry}:$REFPATH ;;
            esac
        done
        REFPATH=${REFPATH%:}
        unset entry 
    fi
}
