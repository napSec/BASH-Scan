#!/bin/bash bashScan.sh

#This script will prompt the user to enter the target IP address or hostname to scan, 
#and then offer them a choice of output formats (text, CSV, or XML). The user can then enter the desired #name for the output file, and the script will perform a port scan using nmap and save the output to a #file with the chosen name and extension. 
## Finally, the script will open a new terminal session and display the contents of the output file.
##Note: The command to open a new terminal and execute a command (gnome-terminal -e "command") may not #work on all systems. 
##You may need to use a different command, such as xterm -e "command", depending on your system and the #Terminal emulator you are using.

echo "
#| __ )  / \  / ___|| | | | / ___| / ___|  / \  | \ | |
#|  _ \ / _ \ \___ \| |_| | \___ \| |     / _ \ |  \| |
#| |_) / ___ \ ___) |  _  |  ___) | |___ / ___ \| |\  |
#|____/_/   \_\____/|_| |_| |____/ \____/_/   \_\_| \_|" 
echo "Enter the target IP address or hostname to scan"

# Get target from user input
read target

# Output format and file name input
echo "Select format for output:"
echo "1. Text file"
echo "2. CSV file"
echo "3. XML file"
read -p "Enter the number for your selection: " format" 

# Get output file name from user
echo "Enter the name for the output file    s (without extension):"
read filename

# Check user's selection and set file extension
if [ $format -eq 1 ]; then
  extension=".txt"
elif [ $format -eq 2 ]; then
  extension=".csv"
elif [ $format -eq 3 ]; then
  extension=".xml"
else
  echo "Invalid selection"
  exit 1
fi

# Perform NMAP port scan and save output to file
nmap -oN "$filename$extension" $target

# Display output in new terminal session
xterm -e "cat $filename$extension"

echo "Scan complete!"
