#!/bin/bash

log_file="logs/network.log"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

log_message() {
    echo "[$timestamp] $1" >> $log_file
}

check_dependencies() {
    # Check if Ansible is installed
    if ! command -v ansible &>/dev/null; then
        log_message "ERROR: Ansible is not installed. Please install Ansible first."
        exit 1
    fi

    # Check if required directories exist
    if [ ! -d "ansible/playbooks" ]; then
        log_message "ERROR: ansible/playbooks directory not found."
        exit 1
    fi
}

log_message "Starting network automation tasks..."

# Check dependencies
check_dependencies

# Update configurations with error handling
log_message "Running configuration update..."
ansible-playbook ansible/playbooks/update_config.yml -i ansible/inventory/devices.yml || {
    log_message "ERROR: Configuration update failed."
    exit 1
}
log_message "Configuration update completed."

# Backup configurations with error handling
log_message "Running configuration backup..."
ansible-playbook ansible/playbooks/backup_config.yml -i ansible/inventory/devices.yml || {
    log_message "ERROR: Configuration backup failed."
    exit 1
}
log_message "Configuration backup completed."

# Monitor network devices with error handling
log_message "Running network monitoring..."
ansible-playbook ansible/playbooks/monitor_devices.yml -i ansible/inventory/devices.yml || {
    log_message "ERROR: Network monitoring failed."
    exit 1
}
log_message "Network monitoring completed."

log_message "Network automation tasks finished."
