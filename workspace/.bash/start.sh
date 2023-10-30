#!/bin/bash
function start () {
    path=${1}

    if [[ "$path" ]]; then
        project=$(echo "$path" | sed 's:/*$::')
        printf "\n${GREEN}[+] Starting '${project}'${NC}\n"

        docker-compose -f ${path}${compose} up -d

        if [[ "$project" = 'workspace' ]]; then
            echo -e '\nDone! Visit:'
            echo -e "\e]8;;http://localhost:8080\e\\http://localhost:8080\e]8;;\e\\"
            echo -e "\e]8;;http://phpmyadmin.localhost\e\\http://phpmyadmin.localhost\e]8;;\e\\"
            echo -e "\e]8;;http://rabbitmq.localhost\e\\http://rabbitmq.localhost\e]8;;\e\\"
            echo -e "\e]8;;http://mailpit.localhost\e\\http://mailpit.localhost\e]8;;\e\\"
        else
            echo -e '\nDone! Visit:'
            echo -e "\e]8;;http://${project}.localhost\e\\http://${project}.localhost\e]8;;\e\\"
        fi

        [ "$0" = "$BASH_SOURCE" ] && exit 1 || return 1;
    fi

    printf "\n${GREEN}Starting all environments...${NC}\n";

    start 'workspace'
    sleep 1

    printf "\n[+] Detecting projects\n"

    find . -path "*${compose}" -type f -not -path "./workspace/*" | while read fname; do
        path=${fname:2}
        project=${path%"${compose}"}
        start $project
        sleep 1
    done

    return 1
}