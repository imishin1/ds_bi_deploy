#!/bin/bash

# Прерывать скрипт при любой ошибке
set -e

print_data_solutions_banner(){
echo -e "\033[32m"
echo -e "____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____"
echo -e ""
echo -e " ██████╗  █████╗ ████████╗ █████╗         ███████╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗███████╗"
echo -e " ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗        ██╔════╝██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝"
echo -e " ██║  ██║███████║   ██║   ███████║        ███████╗██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║███████╗"
echo -e " ██║  ██║██╔══██║   ██║   ██╔══██║        ╚════██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║"
echo -e " ██████╔╝██║  ██║   ██║   ██║  ██║        ███████║╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║███████║"
echo -e " ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝        ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝"
echo -e ""
echo -e "____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____"
echo -e ""
echo -e ""
echo -e ""
echo -e "                                         INSTALLATION FOR DS.BI                                                    "
echo -e "\033[0m"
}

print_separator(){
echo -e "\033[32m"
echo -e ""
echo -e "____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____"
echo -e ""
echo -e "\033[0m"
}

# Функция для установки необходимых компонентов: Git и Ansible
install_requirements() {
    echo "Установка предварительных пакетов"
    echo -e ""
    sudo apt-get update
    sudo apt-get install -y git ansible
    echo "Git и Ansible установлены."
}

# Функция для клонирования репозитория
clone_repository() {
    echo -e "Подготовка файлов для установки"
    if [ -d "$HOME/ds_bi_deploy/.git" ]; then
        cd "$HOME/ds_bi_deploy"
        git pull
    else
        git clone https://github.com/imishin1/ds_bi_deploy.git "$HOME/ds_bi_deploy"
    fi
}

# Функция для перехода в директорию и запуска Ansible playbook
run_playbook() {
    echo "Начало установки"
    cd "$HOME/ds_bi_deploy" && ansible-playbook -i "localhost," -c local ./playbooks_examples/install_with_redis.yml
    echo "Установка успешно завершена"
    echo "DS.BI доступен по порту 8088"
}

# Основная логика скрипта
main() {
    print_data_solutions_banner
    print_separator
    install_requirements
    print_separator
    clone_repository
    print_separator
    run_playbook
    print_separator
}

# Запуск основной логики скрипта
main