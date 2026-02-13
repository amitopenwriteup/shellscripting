

#!/bin/bash

echo "======================================="
echo "   Datadog Agent Uninstall - Ubuntu   "
echo "======================================="

# Stop service if running
if systemctl list-units --type=service | grep -q datadog-agent; then
    echo "Stopping datadog-agent service..."
    sudo systemctl stop datadog-agent
fi

# Disable service
if systemctl list-unit-files | grep -q datadog-agent; then
    echo "Disabling datadog-agent service..."
    sudo systemctl disable datadog-agent
fi

# Remove package
echo "Removing datadog-agent package..."
sudo apt-get remove --purge -y datadog-agent

# Remove Datadog APT repository (if exists)
echo "Removing Datadog repository..."
sudo rm -f /etc/apt/sources.list.d/datadog.list
sudo rm -f /usr/share/keyrings/datadog-archive-keyring.gpg

# Clean dependencies
sudo apt-get autoremove -y
sudo apt-get autoclean

# Remove leftover directories
echo "Cleaning leftover files..."
sudo rm -rf /etc/datadog-agent
sudo rm -rf /var/log/datadog
sudo rm -rf /opt/datadog-agent
sudo rm -rf /usr/bin/datadog-agent
sudo rm -rf /usr/local/bin/datadog-agent

# Reload systemd
sudo systemctl daemon-reload

echo "======================================="
echo "   Datadog Agent removed successfully  "
echo "======================================="
