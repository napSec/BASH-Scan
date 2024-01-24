# bashScan.sh - Red Team NMAP Port Scan 

This Bash script facilitates a simple yet effective port scanning using NMAP. The user is prompted to enter the target IP address or hostname, choose an output format (text, CSV, or XML), and provide a name for the output file. The script then performs a port scan and saves the results in the specified format.

## Usage

1. Make sure you have NMAP installed on your system.

2. Download the script:

```bash
wget https://example.com/path/to/bashScan.sh
```

3. Provide execute permissions:

```bash
chmod +x bashScan.sh
```

4. Run the script:

```bash
./bashScan.sh
```

## Script Walkthrough

### 1. Target Input

The script starts by prompting the user to enter the target IP address or hostname for the port scan.

```bash
echo "Enter the target IP address or hostname to scan"
read target
```

### 2. Output Format Selection

The user is then given the option to choose the output format:

- Text file
- CSV file
- XML file

```bash
echo "Select format for output:"
echo "1. Text file"
echo "2. CSV file"
echo "3. XML file"
read -p "Enter the number for your selection: " format
```

### 3. Output File Name Input

Next, the user is prompted to enter a name for the output file (without extension).

```bash
echo "Enter the name for the output file (without extension):"
read filename
```

### 4. File Extension Check

The script checks the user's format selection and sets the corresponding file extension.

```bash
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
```

### 5. NMAP Port Scan

Using the NMAP tool, the script performs a port scan and saves the output to the specified file.

```bash
nmap -oN "$filename$extension" $target
```

### 6. Display Output

The script opens a new terminal session to display the contents of the output file.

```bash
xterm -e "cat $filename$extension"
```

## Note

- The command to open a new terminal and execute a command (`xterm -e "command"`) may not work on all systems. You may need to use a different command, such as `gnome-terminal -e "command"`, depending on your system and the terminal emulator you are using.

- Ensure you have the necessary permissions to run the script and execute NMAP.

