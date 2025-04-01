#!/bin/bash
log_file="logs/network.log"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

log_message() {
    echo "[$timestamp] $1" >> $log_file
}

log_message "Starting network automation tasks..."

# Update configurations
ansible-playbook ansible/playbooks/update_config.yml -i ansible/inventory/devices.yml
log_message "Configuration update completed."

# Backup configurations
ansible-playbook ansible/playbooks/backup_config.yml -i ansible/inventory/devices.yml
log_message "Configuration backup completed."

# Monitor network devices
ansible-playbook ansible/playbooks/monitor_devices.yml -i ansible/inventory/devices.yml
log_message "Network monitoring completed."

log_message "Network automation tasks finished."
