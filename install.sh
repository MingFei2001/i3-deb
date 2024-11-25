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
# - Installs a carefully selected stack of tools to optimize programming workflows.
# - Logs all actions to a log file for transparency and debugging.
# - Includes uninstallation functionality with clean residual file removal.
# - Ensures minimal user input with clear instructions and feedback.
# 
# Usage:
# - Run the script to install the i3wm environment on your Debian system.
# - Use the `-u` option to uninstall the installed components and clean up.
# =================================================================================
# TODO: add picom config to assets
# =================================================================================

# Variables
PROGRAMS=(
    "i3"
    "dmenu"
    "kitty"
    "nano"
    # "nvim"
    "tmux"
    "btop"
    "htop"
    "picom"
) # List of programs to install; easily editable
LOGFILE="i3-deb-install.log" # Log file to record actions
IS_UNINSTALL=false # Default mode is installation, set to true if -u is passed

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
    echo "Welcome to i3-deb Install Script!"
    echo "This script will install i3wm and its components on your Debian system."
    echo "Before proceeding, it's recommended to back up your configurations."
    echo "========================================"
    echo "Are you sure you want to proceed? [Y/n]"
}

# Check for necessary commands
check_requirements() {
    if ! command -v apt > /dev/null 2>&1; then
        echo "Error: 'apt' is not installed or not available in PATH."
        echo "Please ensure you are using a Debian-based system with 'apt' installed."
        exit 1
    fi
}

# Parse script arguments
parse_arguments() {
    while getopts "u" opt; do
        case $opt in
            u) IS_UNINSTALL=true ;;
            *) echo "Invalid option: -$OPTARG"; exit 1 ;;
        esac
    done
}

# Function to validate user input
get_user_input() {
    read -rp "Your choice: " user_input
    case "$user_input" in
        [Yy]* | "") return 0 ;;  # Proceed
        [Nn]*) echo "Exiting the script. Goodbye!"; exit 0 ;; # Exit
        *) echo "Invalid input. Please enter Y, n, or press Enter."; return 1 ;;
    esac
}

# Update and upgrade system
update_system() {
    echo "Updating and upgrading the system..."
    sudo apt-get update && sudo apt-get upgrade -y >> "$LOGFILE" 2>&1
    echo "System updated successfully."
}

# Install programs
install_programs() {
    echo "Starting the installation process..."
    echo "Installation log will be stored in $LOGFILE"
    for program in "${PROGRAMS[@]}"; do
        echo "Installing $program..."
        echo "Installing $program..." >> "$LOGFILE"
        if sudo apt-get install -y "$program" >> "$LOGFILE" 2>&1; then
            echo "$program installed successfully."
            echo "$program installed successfully." >> "$LOGFILE"
        else
            echo "Failed to install $program. Retrying..."
            echo "Retrying installation for $program..." >> "$LOGFILE"
            if ! sudo apt-get install -y "$program" >> "$LOGFILE" 2>&1; then
                echo "Failed to install $program after retry. Skipping."
                echo "Failed to install $program after retry." >> "$LOGFILE"
            fi
        fi
    done
    echo "Installation process completed!"
}

# Uninstall programs
uninstall_programs() {
    echo "Starting the uninstallation process..."
    for program in "${PROGRAMS[@]}"; do
        echo "Uninstalling $program..."
        echo "Uninstalling $program..." >> "$LOGFILE"
        if sudo apt-get remove -y "$program" >> "$LOGFILE" 2>&1; then
            echo "$program uninstalled successfully."
            echo "$program uninstalled successfully." >> "$LOGFILE"
        else
            echo "Failed to uninstall $program. Check $LOGFILE for details."
            echo "Failed to uninstall $program." >> "$LOGFILE"
        fi
    done
    echo "Uninstallation process completed!"
    cleanup_system
}

# Cleanup residual files and dependencies
cleanup_system() {
    echo "Performing cleanup of residual files and dependencies..."
    if sudo apt-get autoremove -y >> "$LOGFILE" 2>&1 && sudo apt-get autoclean -y >> "$LOGFILE" 2>&1; then
        echo "System cleanup completed successfully."
        echo "System cleanup completed successfully." >> "$LOGFILE"
    else
        echo "Failed to perform cleanup. Check $LOGFILE for details."
        echo "Failed to perform cleanup." >> "$LOGFILE"
    fi
}

# Function to copy bash_aliases to the user's home directory
copy_config() {
    if [ -f "$PWD/assets/bash_aliases" ]; then
        echo "Copying bash_aliases to the user's home directory as .bash_aliases..."
        cp "$PWD/assets/bash_aliases" "$HOME/.bash_aliases"
        if [ $? -eq 0 ]; then
            echo "bash_aliases copied successfully to $HOME/.bash_aliases"
        else
            echo "Failed to copy bash_aliases. Please check the file permissions and try again."
        fi
    else
        echo "Error: bash_aliases file not found in assets folder."
    fi
}

# Main logic
main() {
    parse_arguments
    check_requirements

    if $IS_UNINSTALL; then
        echo "Uninstallation mode detected."
        uninstall_programs
    else
        while true; do
            print_menu
            get_user_input && break
        done

        update_system
        install_programs
        copy_config

        echo "Installation completed successfully. Please log out or reboot for changes to take effect."
    fi
}

# Run the script
main "$@"
