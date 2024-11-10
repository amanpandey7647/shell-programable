#!/bin/bash

# Description of the script
description="This is a general-purpose shell script with advanced features specifically tailored for macOS, including file manipulation, system information, network utilities, and more. It provides a comprehensive set of commands to automate tasks and gain insights into your macOS system."

# List of available commands with descriptions
commands="
  help                 : Display this help message.
  info                 : Show script information.
  list                 : List available commands.
  search               : Search for a string in files.
  download             : Download a file from a URL.
  upload               : Upload a file to a remote server.
  delete               : Delete a file.
  file-info            : Display information about a file.
  system-info          : Show system information (OS, kernel, CPU, uptime, memory, load).
  network-info          : Display network information (interfaces, gateway, DNS).
  process-info          : List running processes.
  disk-usage           : Show disk usage for all mounted file systems.
  check-internet        : Check internet connectivity.
  ping                  : Send ICMP echo requests to a host.
  traceroute            : Trace the route to a host.
  ssh-connect           : Connect to a remote server via SSH.
  remote-command        : Execute a command on a remote server.
  create-directory      : Create a new directory.
  copy-files            : Copy multiple files to a destination.
  move-files            : Move multiple files to a destination.
  extract-archive       : Extract contents of an archive file.
  create-archive        : Create an archive file from multiple files.
  install-package       : Install a package using Homebrew.
  uninstall-package     : Uninstall a package using Homebrew.
  update-system         : Update system packages using Homebrew.
  restart-service       : Restart a macOS system service.
  stop-service          : Stop a macOS system service.
  start-service         : Start a macOS system service.
  show-services         : List all available services.
  find-file             : Search for files matching a pattern.
  open-app             : Open an application.
  open-url              : Open a URL in your web browser.
  show-connected-devices : Display connected Bluetooth and USB devices.
"

# Print help message
help() {
  echo "$description"
  echo ""
  echo "Available commands:"
  echo "$commands"
}

# Print script information
info() {
  echo "Script name: $0"
  echo "Version: 1.0"
  echo "Author: Your Name"
  echo "Description: $description"
  echo "Commands: $commands"
}

# List available commands
list() {
  echo "Available commands:"
  echo "$commands"
}

# Search for a string in files
search() {
  if [ $# -lt 2 ]; then
    echo "Error: Please provide a search term and at least one file path."
    return 1
  fi
  search_term="$1"
  shift
  for file in "$@"; do
    echo "Searching in file: $file"
    grep "$search_term" "$file"
  done
}

# Download a file
download() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide a URL to download."
    return 1
  fi
  url="$1"
  wget "$url"
}

# Upload a file using scp
upload() {
  if [ $# -lt 2 ]; then
    echo "Error: Please provide a file path and a remote destination."
    return 1
  fi
  file_path="$1"
  remote_destination="$2"
  scp "$file_path" "$remote_destination"
}

# Delete a file
delete() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide a file path to delete."
    return 1
  fi
  file_path="$1"
  rm "$file_path"
}

# Provide file information
file-info() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide a file path."
    return 1
  fi
  file_path="$1"
  file_size=$(du -b "$file_path" | awk '{print $1}')
  file_type=$(file "$file_path" | awk '{print $2}')
  file_date=$(stat -c %y "$file_path")
  echo "File: $file_path"
  echo "Size: $file_size bytes"
  echo "Type: $file_type"
  echo "Last Modified: $file_date"
}

# Provide system information
system-info() {
  echo "Operating System: $(sw_vers -productName)"
  echo "Kernel Version: $(uname -r)"
  echo "CPU Architecture: $(uname -m)"
  echo "System Uptime: $(uptime -p)"
  echo "Memory Usage: $(top -l 1 | awk '/PhysMem:/ {print $4"/"$5}')"
  echo "CPU Load Average: $(top -l 1 | awk '/Load Avg:/ {print $4,$5,$6}')"
}

# Provide network information
network-info() {
  echo "Network Interfaces: $(networksetup -listallhardwareports | grep -Eo '([a-zA-Z0-9]+):')"
  echo "Default Gateway: $(route -n get 0.0.0.0 | awk '{print $2}')"
  echo "DNS Servers: $(scutil --dns | grep -Eo 'nameserver ([0-9.]+)' | awk '{print $2}')"
}

# Provide information about running processes
process-info() {
  ps aux
}

# Display disk usage information
disk-usage() {
  df -h
}

# Check internet connectivity
check-internet() {
  ping -c 1 -W 1 google.com > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Internet connection is available."
  else
    echo "Internet connection is unavailable."
  fi
}

# Send ICMP echo requests to a host
ping() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide a host to ping."
    return 1
  fi
  host="$1"
  ping -c 4 "$host"
}

# Trace the route to a host
traceroute() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide a host to trace route to."
    return 1
  fi
  host="$1"
  traceroute "$host"
}

# Connect to a remote server via SSH
ssh-connect() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the remote server address to connect to."
    return 1
  fi
  server="$1"
  ssh "$server"
}

# Execute a command on a remote server
remote-command() {
  if [ $# -lt 2 ]; then
    echo "Error: Please provide the server address and the command to execute."
    return 1
  fi
  server="$1"
  command="$2"
  ssh "$server" "$command"
}

# Create a new directory
create-directory() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the directory name to create."
    return 1
  fi
  dir="$1"
  mkdir -p "$dir"
}

# Copy multiple files to a destination
copy-files() {
  if [ $# -lt 2 ]; then
    echo "Error: Please provide the source files and the destination directory."
    return 1
  fi
  source_files="$@"
  destination="$1"
  shift
  for file in "$@"; do
    cp "$file" "$destination"
  done
}

# Move multiple files to a destination
move-files() {
  if [ $# -lt 2 ]; then
    echo "Error: Please provide the source files and the destination directory."
    return 1
  fi
  source_files="$@"
  destination="$1"
  shift
  for file in "$@"; do
    mv "$file" "$destination"
  done
}

# Extract contents of an archive file
extract-archive() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the archive file to extract."
    return 1
  fi
  archive_file="$1"
  if [[ "$archive_file" =~ \.zip$ ]]; then
    unzip "$archive_file"
  elif [[ "$archive_file" =~ \.tar\.gz$ ]]; then
    tar -xzf "$archive_file"
  elif [[ "$archive_file" =~ \.tar\.bz2$ ]]; then
    tar -xjf "$archive_file"
  else
    echo "Unsupported archive format."
    return 1
  fi
}

# Create an archive file from multiple files
create-archive() {
  if [ $# -lt 2 ]; then
    echo "Error: Please provide the archive name and the files to archive."
    return 1
  fi
  archive_name="$1"
  shift
  files="$@"
  if [[ "$archive_name" =~ \.zip$ ]]; then
    zip "$archive_name" "$files"
  elif [[ "$archive_name" =~ \.tar\.gz$ ]]; then
    tar -czf "$archive_name" "$files"
  elif [[ "$archive_name" =~ \.tar\.bz2$ ]]; then
    tar -cjf "$archive_name" "$files"
  else
    echo "Unsupported archive format."
    return 1
  fi
}

# Install a package using Homebrew
install-package() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the package name to install."
    return 1
  fi
  package_name="$1"
  brew install "$package_name"
}

# Uninstall a package using Homebrew
uninstall-package() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the package name to uninstall."
    return 1
  fi
  package_name="$1"
  brew uninstall "$package_name"
}

# Update system packages using Homebrew
update-system() {
  brew update && brew upgrade
}

# Restart a macOS system service
restart-service() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the service name to restart."
    return 1
  fi
  service_name="$1"
  sudo launchctl unload -w /System/Library/LaunchDaemons/"$service_name".plist && sudo launchctl load -w /System/Library/LaunchDaemons/"$service_name".plist
}

# Stop a macOS system service
stop-service() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the service name to stop."
    return 1
  fi
  service_name="$1"
  sudo launchctl unload -w /System/Library/LaunchDaemons/"$service_name".plist
}

# Start a macOS system service
start-service() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the service name to start."
    return 1
  fi
  service_name="$1"
  sudo launchctl load -w /System/Library/LaunchDaemons/"$service_name".plist
}

# List all available services
show-services() {
  ls /System/Library/LaunchDaemons/*.plist | sed 's/\.plist$//' | sed 's/\/System\/Library\/LaunchDaemons\///g'
}

# Search for files matching a pattern
find-file() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide a search pattern."
    return 1
  fi
  pattern="$1"
  find . -type f -name "*$pattern*"
}

# Open an application
open-app() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the application name to open."
    return 1
  fi
  app_name="$1"
  open -a "$app_name"
}

# Open a URL in your web browser
open-url() {
  if [ $# -lt 1 ]; then
    echo "Error: Please provide the URL to open."
    return 1
  fi
  url="$1"
  open "$url"
}

# Display connected Bluetooth and USB devices
show-connected-devices() {
  echo "Bluetooth Devices:"
  ioreg -r -c IOBluetoothDevice | grep -E 'Name|IOBluetoothDeviceID' | awk '{print $3 ":" $NF}'
  echo ""
  echo "USB Devices:"
  ioreg -r -c IOUSBDevice | grep -E 'Name|IOUSBDeviceID' | awk '{print $3 ":" $NF}'
}

# Handle command line arguments
if [ "$#" -eq 0 ]; then
  help
else
  command="$1"
  shift
  case "$command" in
    help)
      help
      ;;
    info)
      info
      ;;
    list)
      list
      ;;
    search)
      search "$@"
      ;;
    download)
      download "$@"
      ;;
    upload)
      upload "$@"
      ;;
    delete)
      delete "$@"
      ;;
    file-info)
      file-info "$@"
      ;;
    system-info)
      system-info
      ;;
    network-info)
      network-info
      ;;
    process-info)
      process-info
      ;;
    disk-usage)
      disk-usage
      ;;
    check-internet)
      check-internet
      ;;
    ping)
      ping "$@"
      ;;
    traceroute)
      traceroute "$@"
      ;;
    ssh-connect)
      ssh-connect "$@"
      ;;
    remote-command)
      remote-command "$@"
      ;;
    create-directory)
      create-directory "$@"
      ;;
    copy-files)
      copy-files "$@"
      ;;
    move-files)
      move-files "$@"
      ;;
    extract-archive)
      extract-archive "$@"
      ;;
    create-archive)
      create-archive "$@"
      ;;
    install-package)
      install-package "$@"
      ;;
    uninstall-package)
      uninstall-package "$@"
      ;;
    update-system)
      update-system
      ;;
    restart-service)
      restart-service "$@"
      ;;
    stop-service)
      stop-service "$@"
      ;;
    start-service)
      start-service "$@"
      ;;
    show-services)
      show-services
      ;;
    find-file)
      find-file "$@"
      ;;
    open-app)
      open-app "$@"
      ;;
    open-url)
      open-url "$@"
      ;;
    show-connected-devices)
      show-connected-devices
      ;;
    *)
      echo "Invalid command: $command"
      help
      ;;
  esac
fi
