  Okay, here is the updated `README.md` with the Apache License 2.0:

```markdown
# Advanced Shell Script for System Administration

This repository contains a general-purpose shell script with advanced features for system administration, file manipulation, network management, and more. It offers a comprehensive set of commands to automate tasks and gain insights into your system, making it a powerful tool for users on both macOS and Linux.

## Features

This script provides a wide range of functionalities, including:

**System Information & Management:**

* **System Information:** Display information about your operating system, kernel version, CPU, memory usage, uptime, and CPU load.
* **Network Information:** Show network interface details, default gateway, and DNS servers.
* **Process Management:** List running processes.
* **Disk Usage:** Display disk usage for all mounted file systems.
* **Internet Connectivity Check:** Determine if an internet connection is available.
* **Service Management:** Restart, stop, or start system services.
* **Package Management (macOS):** Install, uninstall, and update packages using Homebrew.
* **Package Management (Linux):** Install, uninstall, and update packages using apt-get.

**File & Directory Management:**

* **File Search:** Search for files containing a specific string.
* **File Download:** Download files from URLs.
* **File Upload:** Upload files to remote servers using SCP.
* **File Deletion:** Delete files.
* **File Information:** Display information about a file (size, type, last modified date).
* **Directory Creation:** Create new directories.
* **File Copy & Move:** Copy or move multiple files to a destination.
* **Archive Manipulation:** Extract contents from and create archive files (ZIP, TAR.GZ, TAR.BZ2).

**Networking:**

* **Ping:** Send ICMP echo requests to a host.
* **Traceroute:** Trace the network path to a host.
* **SSH Connect:** Establish an SSH connection to a remote server.
* **Remote Command Execution:** Execute commands on a remote server via SSH.

**macOS-Specific Features:**

* **Open Application:** Open an application.
* **Open URL:** Open a URL in your web browser.
* **Show Connected Devices:** Display connected Bluetooth and USB devices.

## Installation

### macOS

1. **Install Homebrew:** If you haven't already, install Homebrew, the package manager for macOS, by running the following command in your terminal:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Download the Script:** Download the `macos_advanced_script.sh` file from this repository.

3. **Make it Executable:** Make the script executable by running the following command in your terminal:

   ```bash
   chmod +x macos_advanced_script.sh
   ```

### Linux

1. **Download the Script:** Download the `advanced_script.sh` file from this repository.

2. **Make it Executable:** Make the script executable by running the following command in your terminal:

   ```bash
   chmod +x advanced_script.sh
   ```

## Usage

1. **Open Terminal:** Open a terminal on your macOS or Linux system.

2. **Navigate to the Script's Location:** Use the `cd` command to navigate to the directory where you saved the script file.

3. **Run the Script:** Execute the script using the command:

   ```bash
   ./advanced_script.sh <command> [options]
   ```

   Replace `<command>` with the command you want to run. Refer to the "Available Commands" section in the script's help message for a list of commands and their usage.

   For example:

   * **Check internet connectivity:**
     ```bash
     ./advanced_script.sh check-internet
     ```
   * **Install the `vim` package on macOS:**
     ```bash
     ./macos_advanced_script.sh install-package vim
     ```
   * **Open the "Safari" browser:**
     ```bash
     ./macos_advanced_script.sh open-app "Safari"
     ```

## Contributing

Contributions are welcome! If you find any bugs or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](https://github.com/amanpandey7647/shell-programable/blob/main/LICENSE) file for details. 
```
