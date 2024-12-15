#!/usr/bin/env bash

# =================================================================================
#     _________ ____       __
#    /  _/__  // __ \___  / /_
#    / /  /_ </ / / / _ \/ __ \
#  _/ / ___/ / /_/ /  __/ /_/ /
# /___//____/_____/\___/_.___/
# =================================================================================
# i3-deb: Minimal i3 Window Manager Installer
# =================================================================================
# This script automates the installation and uninstallation of 
# the i3 Window Manager and its essential components on Debian-based systems.
# 
# Key Features:
# - Installs a selected stack of tools to optimize programming workflows.
# - Logs all actions to a log file for debugging.
# - Ensures minimal user input with clear instructions and feedback.
# 
# Usage:
# - Run the script to install the i3wm environment on your Debian system.
# =================================================================================
#  TODO:
# + add picom & i3 basic config to assets
# + add kickstarter nvim config hook
# =================================================================================

# List of programs to install; easily editable
PROGRAMS=(
    "i3"
    "dmenu"
    "kitty"
    "vim"
    "nvim"
    "tmux"
    "htop"
    "picom"
)

## STANDALONE WM ENVIRONMENT
## ADD TO LIST ABOVE TO INSTALL
# "pipewire"                # for audio and video
# "pavucontrol"             # for controlling volume
# "brightnessctl"           # for controlling brightness
# "networkmanager"          # for managing networking
# "blueman"                 # for managing bluetooth
# "xfce4-power-manager"     # for power and session management
# "lightdm"                 # lightweight login manager

# Log file to record actions
LOGFILE="i3-deb-install.log"

# ASCII Art
print_ascii_art() {
    cat << "EOF"
    _________ ____       __
   /  _/__  // __ \___  / /_
   / /  /_ </ / / / _ \/ __ \
 _/ / ___/ / /_/ /  __/ /_/ /
/___//____/_____/\___/_.___/
EOF
}

# Function to print the welcome menu
print_menu() {
    print_ascii_art
    echo "| Welcome to i3-deb Install Script!"
    echo "| This script will install an workflow optimized environment"
    echo "| on your debian xfce machine for maximum efficiency"
    echo "| Before proceeding, it's recommended to back up your configurations."
    echo "| ========================================"
    echo "| Are you sure you want to proceed? [Y/n]"
}

# Check for necessary commands
check_requirements() {
    if ! command -v apt > /dev/null 2>&1; then
        echo "| Error: 'apt' is not installed or not available in PATH."
        echo "| Please ensure you are using a Debian-based system with 'apt' installed."
        exit 1
    fi
}

# Update and upgrade system
update_system() {
    echo "| Updating and upgrading the system..."
    echo "| Updating and upgrading the system..." >> "$LOGFILE"
    sudo apt-get update && sudo apt-get upgrade -y >> "$LOGFILE" 2>&1
    echo "| System updated successfully."
}

# Install programs
install_programs() {
    echo "| Starting the installation process..."
    echo "| Installation log will be stored in $LOGFILE"
    for program in "${PROGRAMS[@]}"; do
        echo "| Installing $program..."
        echo "| Installing $program..." >> "$LOGFILE"
        if sudo apt-get install -y "$program" >> "$LOGFILE" 2>&1; then
            echo "| $program installed successfully."
            echo "| $program installed successfully." >> "$LOGFILE"
        else
            echo "| Failed to install $program."
            echo "| Failed to install $program." >> "$LOGFILE"
        fi
    done
    echo "| Program installation completed!"
    echo "| Program installation completed!" >> "$LOGFILE"
}

# Function to copy bash_aliases to the user's home directory
copy_config() {
    if [ -f "$PWD/assets/bash_aliases" ]; then
        echo "| Copying bash_aliases to the user's home directory as .bash_aliases..."
        echo "| Copying bash_aliases to the user's home directory as .bash_aliases..." >> "$LOGFILE"
        cp "$PWD/assets/bash_aliases" "$HOME/.bash_aliases"
        if [ $? -eq 0 ]; then
            echo "| bash_aliases copied successfully to $HOME/.bash_aliases"
            echo "| bash_aliases copied successfully to $HOME/.bash_aliases" >> "$LOGFILE"
        else
            echo "| Failed to copy bash_aliases. Please check the file permissions and try again."
            echo "| Failed to copy bash_aliases. Please check the file permissions and try again." >> "$LOGFILE"
        fi
    else
        echo "| Error: bash_aliases file not found in assets folder."
        echo "| Error: bash_aliases file not found in assets folder." >> "$LOGFILE"
    fi
}

kickstart_nvim () {
    echo "| this function currently does nothing ..."
}

# Main logic
main() {
    check_requirements

    while true; do
        print_menu
        read -rp "| Your choice: " user_input
        case "$user_input" in
            [Yy]* | "")
                update_system
                install_programs
                copy_config
                kickstart_nvim

                echo "| Installation completed successfully."
                echo "| Please reboot for changes to take effect."
                exit 0
                ;;
            [Nn]*)
                echo "| Exiting the script. Goodbye!"
                echo "| Exiting the script." >> "$LOGFILE"
                exit 0
                ;;
            *)
                echo "| Invalid input. Please enter Y, n, or press Enter.";;
        esac
    done
}

# Run the script
main "$@"
