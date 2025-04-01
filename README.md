# Network Automation with Ansible

Automates network device configuration updates, backup, and monitoring using Ansible.

## Features:
- Automated switch/router configuration updates.
- Backup and restore network configurations.
- Real-time network monitoring and alerting.
- Daily automated execution with cron jobs.
- Comprehensive logging for each operation.
- Dynamic inventory for changing IP addresses.

## Project Structure:
```
network-automation/
├── ansible/                 # Ansible playbooks for configuration and backup
│   ├── playbooks/           # Contains YAML playbooks
│   │   ├── update_config.yml
│   │   ├── backup_config.yml
│   │   └── monitor_devices.yml
│   └── inventory/           # Inventory file for devices
│       └── devices.yml
├── scripts/                 # Automation scripts
│   └── automate.sh
├── logs/                    # Store logs of operations
│   └── network.log
├── config_backup/           # Backup files for network configurations
├── monitoring/              # Monitoring status and reports
│   └── status_report.txt
└── README.md                # Project description and usage instructions
```

## How to Run:
1. Clone the repository:
   ```bash
   git clone https://github.com/ModarRostom/network-automation.git
   cd network-automation
   ```
2. Make the script executable:
   ```bash
   chmod +x scripts/automate.sh
   ```
3. Run the script:
   ```bash
   ./scripts/automate.sh
   ```
4. Check logs:
   ```bash
   cat logs/network.log
   ```

## Manual Execution of Playbooks:
To run each playbook individually:
- Update configuration:
  ```bash
  ansible-playbook ansible/playbooks/update_config.yml -i ansible/inventory/devices.yml
  ```
- Backup configuration:
  ```bash
  ansible-playbook ansible/playbooks/backup_config.yml -i ansible/inventory/devices.yml
  ```
- Monitor devices:
  ```bash
  ansible-playbook ansible/playbooks/monitor_devices.yml -i ansible/inventory/devices.yml
  ```

## Viewing Logs:
- To check the logs after running the automation script:
  ```bash
  cat logs/network.log
  ```
- To check the monitoring status:
  ```bash
  cat monitoring/status_report.txt
  ```

## Automating the Script Execution:
To set up a cron job for daily execution:
1. Open the cron job editor:
   ```bash
   crontab -e
   ```
2. Add the following line to run the script every day at midnight:
   ```bash
   0 0 * * * /home/username/network-automation/scripts/automate.sh >> /home/username/network-automation/logs/network.log 2>&1
   ```
3. Save and exit.

## Troubleshooting:
- If the script does not execute, ensure it is executable:
  ```bash
  chmod +x scripts/automate.sh
  ```
- Check if Ansible is installed:
  ```bash
  ansible --version
  ```
- Check the cron job status:
  ```bash
  crontab -l
  ```

## Future Improvements:
- Add support for multi-vendor network devices (e.g., Juniper, Huawei).
- Integrate a web-based dashboard to visualize network monitoring results.
- Implement real-time notifications via email or messaging platforms (e.g., Slack).
- Add automated backup file rotation and cleanup.
- Enhance security with SSH key management and secure vault for sensitive data.

## License:
This project is licensed under the MIT License.

## Contact:
For issues or suggestions, please open an issue on the GitHub repository:
[GitHub Issues](https://github.com/ModarRostom/network-automation/issues)

