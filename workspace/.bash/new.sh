#!/bin/bash
function new () {
    project=${1}

    if [[ ! "$project" ]]; then
        echo 'Enter a URL-safe name for the project: '
        read project
    fi
    if [[ ! "$project" =~ ^[a-z0-9][-a-z0-9]{0,61}[a-z0-9]$ ]]; then
        printf "\n${RED}[!] '$project' is not a URL-safe name${NC}\n"

        exit 0
    fi
    if [ -d "./$project" ]; then
        printf "\n${RED}[!] '$project' already exists${NC}\n"

        exit 0
    fi

    printf "\n${GREEN}[+] Creating '${project}'${NC}\n"

    cp -r ./workspace/.stub "./${project}"

    printf "${GREEN}[+] Updating config ${NC}\n"

    sed -i "s/{{__PROJECT__}}/${project}/g" "${project}${compose}"
    sed -i "s/{{__PROJECT__}}/${project}/g" "${project}/.docker/nginx/vhost.conf"

    echo 'Installation complete.'
    echo "Do you want to start '$project' (y/n)?"
    read start

    if [ "$start" != "${start#[Yy]}" ] ;then
        start $project
    fi

    return 1
}
