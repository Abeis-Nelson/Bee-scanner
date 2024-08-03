
#!/bin/bash
       
cat banner.txt
echo \n


if [ "$1" == "" ]
then
echo "Please prodvide the necessary arguments to let the byakugon use its power in your network"
echo "Usage Example: ./bee_scanner.sh 192.168.1."
else
for ip in `seq 1 255`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | sed "s/.$//" &
done
fi
