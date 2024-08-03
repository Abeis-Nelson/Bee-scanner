## Bee Scanner
Bee Scanner is a simple, yet powerful shell script designed to scan a custom range of IP addresses within a network to identify active hosts. Utilizing the ping command, it allows for flexible network exploration, making it an essential tool for network administrators and cybersecurity enthusiasts.

## Prerequisites
To use Bee Scanner, you will need:

 - A Unix-like operating system (Linux, macOS, etc.)
 - Bash shell
 - ping command available (usually pre-installed in most Unix-like systems)

## Installation
1. Download the bee_scanner.sh script to your local machine.
2. Make the script executable by running the following command in your terminal:
   
```bash
chmod +x bee_scanner.sh
```

## Usage
To use Bee Scanner, you need to specify the start and end IP addresses of the range you wish to scan. The script will then attempt to ping each IP address in the specified range and output the addresses that respond.

The general syntax for running the script is:

```bash
./bee_scanner.sh <start_ip> <end_ip>
```
 
## Example
To scan the IP range from 192.168.1.1 to 192.168.1.255, you would use the following command:

```bash
./bee_scanner.sh 192.168.1.1 192.168.1.255
```
   
The script will then ping each IP address within the specified range and print the addresses that respond to the ping.

## Note
- This script performs a simple ICMP echo (ping) to each host in the specified range. Some hosts may be configured to ignore or block ICMP requests, and thus may not appear in the results even if they are active.
- Ensure you have permission to scan the network range you specify to avoid unauthorized access or network disruption.

## License
This project is open-sourced under the MIT License. See the LICENSE file for more details.

