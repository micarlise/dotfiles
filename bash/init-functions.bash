
function addpathf {
    for x in ${1//:/ }; do
		case ":$PATH:" in
            *":${x}:"*) ;; # already in PATH
			*) PATH="${x}:$PATH" ;;
		esac
	done
    unset x 
}

function addpathr {
    for x in ${1//:/ }; do
		case ":$PATH:" in
            *":${x}:"*) ;; # already in PATH
            *) PATH="${PATH%:}:${x%:}" ;;
		esac
	done
    unset x 
}

function removepath {
    if [ -n "${PATH}" ]; then
        local segments=(${PATH//:/ })

        local entries=()
        for ((i="${#segments[@]}"-1;i>=0;i--)); do
            entries+=("${segments[i]}");
        done

        PATH=
        for entry in "${entries[@]}"; do
            case ":${1}:" in
                *":${entry}:"*) ;; # entry labeled for removal
                *) addpathf ${entry} ;; # add everything else
            esac
        done
        PATH=${PATH%:} 
        unset entry 
    fi
}

function cleanpath {
	if [ -n "${PATH}" ]; then
        local segments=(${PATH//:/ }) 

        local entries=()
        for ((i="${#segments[@]}"-1;i>=0;i--)); do
            entries+=("${segments[i]}");
        done

        PATH=
        for entry in "${entries[@]}"; do
            addpathf ${entry}
        done
        PATH=${PATH%:}
        unset entry 
    fi
}
