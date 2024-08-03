#!/bin/bash    
    
# Display the banner    
cat banner.txt    
echo -e "    
"    
    
# Function to convert IP address to integer    
ip_to_int() {    
    local IFS=.    
    read ip1 ip2 ip3 ip4 <<< "$1"    
    echo $((ip1 * 256 ** 3 + ip2 * 256 ** 2 + ip3 * 256 + ip4))    
}    
    
# Function to convert integer to IP address    
int_to_ip() {    
    local ui32=$1    
    local ip n    
    for n in 1 2 3 4; do    
        ip=$((ui32 % 256))${ip:+.}$ip    
        ui32=$((ui32 / 256))    
    done    
    echo $ip    
}    
    
# Check if the correct number of arguments is provided    
if [ "$#" -ne 2 ]; then    
    echo "Please provide the necessary arguments to let the scanner use its power in your network."    
    echo "Usage Example: $0 192.168.1.1 192.168.1.255"    
    exit 1    
fi    
    
start_ip="$1"    
end_ip="$2"    
    
# Convert start and end IP addresses to integers    
start_int=$(ip_to_int $start_ip)    
end_int=$(ip_to_int $end_ip)    
    
# Loop through the range    
for int_ip in $(seq $start_int $end_int); do    
    current_ip=$(int_to_ip $int_ip)    
    # Ping the current IP address    
    ping -c 1 -W 1 $current_ip | grep "64 bytes" | cut -d " " -f 4 | sed "s/.$//" &    
done    
    
# Wait for all background jobs to finish    
wait    
