#!/bin/bash

echo -e "${GREEN}"
cat << "EOF"

 _    __ ______ ____  _____  ____ ______ ____ __     ______   ______ __  ___ __  __ _  __
| |  / // ____// __ \/ ___/ /  _//_  __//  _// /    / ____/  /_  __//  |/  // / / /| |/ /
| | / // __/  / /_/ /\__ \  / /   / /   / / / /    / __/      / /  / /|_/ // / / / |   / 
| |/ // /___ / _, _/___/ /_/ /   / /  _/ / / /___ / /___     / /  / /  / // /_/ / /   |  
|___//_____//_/ |_|/____//___/  /_/  /___//_____//_____/    /_/  /_/  /_/ \____/ /_/|_|  
                                                                                         
                            By @its-ashu-otf
EOF

echo -e "${NC}"
check_and_install_tmux() {
    if ! command -v tmux &> /dev/null; then
        echo -e "${ORANGE}tmux could not be found, installing...${NC}"
        sudo apt-get update && sudo apt-get install -y tmux
        if [ $? -eq 0 ]; then
            echo -e "${ORANGE}tmux installed successfully.${NC}"
        else
            echo -e "${ORANGE}Failed to install tmux.${NC}"
            exit 1
        fi
    else
        echo -e "${ORANGE}tmux is already installed.${NC}"
    fi
}

fetch_tmux_config() {
    cd
    if [ -d ".tmux" ]; then
        echo -e "${ORANGE}.tmux directory already exists. Checking for updates...${NC}"
        cd .tmux
        git pull
        cd ..
        ln -s -f .tmux/.tmux.conf
        cp .tmux/.tmux.conf.local .
    else
        echo -e "${ORANGE}.tmux directory does not exist. Cloning repository...${NC}"
        git clone https://github.com/its-ashu-otf/.tmux.git
        ln -s -f .tmux/.tmux.conf
        cp .tmux/.tmux.conf.local .
    fi
}

check_and_install_xclip() {
    if ! command -v xclip &> /dev/null; then
        echo -e "${BLUE}xclip could not be found, installing...${NC}"
        sudo apt-get update && sudo apt-get install -y xclip
        if [ $? -eq 0 ]; then
            echo -e "${BLUE}xclip installed successfully.${NC}"
        else
            echo -e "${BLUE}Failed to install xclip.${NC}"
            exit 1
        fi
    else
        echo -e "${BLUE}xclip is already installed.${NC}"
    fi
}

# Function Call

# Check if tmux is installed, if not, install it
check_and_install_tmux

# Fetch the tmux configuration
fetch_tmux_config

# Check if xclip is installed, if not, install it
check_and_install_xclip
