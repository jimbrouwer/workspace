#!/bin/bash
function stop () {
    path=${1}

    if [[ "$path" ]]; then
        project=$(echo "$path" | sed 's:/*$::')
        printf "\n${RED}[+] Stopping '${project}'${NC}\n"

        docker-compose -f ${path}${compose} down

        [ "$0" = "$BASH_SOURCE" ] && exit 1 || return 1;
    fi

    printf "\n${RED}Stopping all environments...${NC}\n";

    printf "\n[+] Detecting projects\n"
    find . -path "*${compose}" -type f -not -path "./workspace/*" | while read fname; do
        path=${fname:2}
        project=${path%"${compose}"}

        stop $project
    done

    stop 'workspace'

    return 1
}