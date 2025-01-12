# List files and directories
```bash
ls # List files and directories in current directory
ls -l # List files and directories in long format
ls -a # List all files and directories, including hidden ones
ls -lh # List files and directories in long format with human-readable file sizes
ls -R # List files and directories recursively
ls -t # List files and directories by last modified time
ls -S # List files and directories by file size
ls -r # List files and directories in reverse order
ls -i # List files and directories with inode numbers
ls -d */ # List directories only
ls -F # List files and directories with indicators
ls -1 # List files and directories in a single column
```

# Change directory
```bash
cd /path/to/directory
cd .. # Change to parent directory
cd ~ # Change to home directory
cd - # Change to previous directory
cd / # Change to root directory 
```

# Print working directory
```bash
pwd # Print the current working directory
```

# Create a new directory
```bash
mkdir new_directory  # Create a new directory
```

# Remove a file
```bash
rm filename # Remove a file
rm -i filename # Prompt before removing a file
rm -f filename # Force removal of a file
rm -r directory_name # Remove a directory and its contents
rm -rf directory_name # Force removal of a directory and its contents
```

# Remove an empty directory
```bash
rmdir directory_name # Remove an empty directory
rmdir -r directory_name # Remove a directory and its contents
rmdir -p directory_name # Remove parent directories if they are empty
```

# Copy a file
```bash
cp source_file destination_file # Copy a file
cp -i source_file destination_file # Prompt before overwriting
cp -r source_directory destination_directory # Copy a directory and its contents
```

# Move or rename a file
```bash
mv old_name new_name # Rename a file
mv file_name /path/to/directory # Move a file to a directory
mv -f old_name new_name # Force move or rename
mv directory_name /path/to/directory # Move a directory to a directory
mv -r source_directory destination_directory # Move a directory and its contents
```

# Display the contents of a file
```bash
cat filename # Display the contents of a file
cat file1 file2 # Concatenate multiple files
cat > filename # Create a new file
cat >> filename # Append to an existing file, adds text to the end of the file
```

# Display the first few lines of a file
```bash
head filename # Display the first few lines of a file
head -n 10 filename # Display the first 10 lines of a file
head -c 100 filename # Display the first 100 bytes of a file
head -n -10 filename # Display all lines except the last 10
head -n 10 filename1 filename2 # Display the first 10 lines of multiple files
head -q filename1 filename2 # Display the first few lines of multiple files without headers
head -v filename1 filename2 # Display the first few lines of multiple files with headers
head -n 10 filename | tail -n 5 # Display lines 6-10 of a file
```

# Display the last few lines of a file
```bash
tail filename # Display the last few lines of a file
tail -n 10 filename # Display the last 10 lines of a file
tail -c 100 filename # Display the last 100 bytes of a file
tail -f filename # Display the last 10 lines of a file and continue to display new lines as they are added
tail -n +10 filename # Display all lines starting from line 10
tail -n 10 filename1 filename2 # Display the last 10 lines of multiple files
tail -q filename1 filename2 # Display the last few lines of multiple files without headers
```

# Search for a string in a file
```bash
grep "search_string" filename # Search for a string in a file
grep -i "search_string" filename # Perform a case-insensitive search
grep -r "search_string" directory # Search for a string in all files in a directory
grep -v "search_string" filename # Display lines that do not contain the search string
grep -c "search_string" filename # Display the number of lines that contain the search string
grep -n "search_string" filename # Display the line numbers of lines that contain the search string
grep -l "search_string" filename # Display the names of files that contain the search string
grep -E "A|T|C|G" filename # Search for any occurrence of A, T, C, or G
grep -E "ATCG" filename # Search for the exact sequence ATCG
grep -E "A{2,}|T{2,}|C{2,}|G{2,}" filename # Search for any occurrence of AA, TT, CC, or GG
grep -E "A{3,}|T{3,}|C{3,}|G{3,}" filename # Search for any occurrence of AAA, TTT, CCC, or GGG
```

# Display disk usage
```bash
df -h # Display disk usage in human-readable format
df -i # Display inode usage
df -T # Display filesystem type
df -hT # Display disk usage with filesystem type in human-readable format
```

# Display memory usage
```bash
free -h # Display memory usage in human-readable format
free -m # Display memory usage in megabytes
free -g # Display memory usage in gigabytes
free -t # Display total memory usage
```

# Display running processes
```bash
ps aux
top # Display real-time system information including running processes
```

# Kill a process by PID
```bash
kill PID
kill -9 PID # Force kill a process
```

# Change file permissions
```bash
chmod 755 filename
chmod +x filename # Add execute permission
```

# Download a file from the internet
```bash
wget http://example.com/file
wget -O new_filename http://example.com/file # Save the file with a different name
wget -c http://example.com/file # Resume a partially downloaded file
wget -r http://example.com/directory # Download an entire directory
```

# Update package list (Debian/Ubuntu)
```bash
sudo apt update
```

# Upgrade installed packages (Debian/Ubuntu)
```bash
sudo apt upgrade
```

# Install a package (Debian/Ubuntu)
```bash
sudo apt install package_name
```

# Create an empty file or update the timestamp of an existing file
```bash
touch filename # Create an empty file
touch file1 file2 # Create multiple files at once
touch file{1..10} # Create multiple files using brace expansion
touch -d "2020-01-01 12:00:00" filename # Update the timestamp of a file
touch -d tomorrow filename # Update the timestamp of a file to tomorrow
```

# Display a message
```bash
echo "Hello, World!" # Display a message
echo file > filename # Write text to a file
echo file >> filename # Append text to a file
```

# Edit a file using nano
```bash
nano filename # Open a file in the nano text editor
```

# Display manual for a command
```bash
man name # Display the manual for a command
man -k keyword # Search for a keyword in the manual pages
man -f name # Display a short description of a command
man -a name # Display all manual pages for a command
```

# Locate a command
```bash
whereis name # Locate the binary, source, and manual page files for a command
whereis -b name # Locate the binary files for a command
whereis -m name # Locate the manual page files for a command
whereis -s name # Locate the source files for a command
```

# Compress files and directories
```bash
zip archive_name.zip file1 file2 # Compress multiple files into a zip archive
zip -r archive_name.zip directory # Compress a directory and its contents into a zip archive
zip -u archive_name.zip file1 # Update a zip archive with new files
zip -d archive_name.zip file1 # Remove a file from a zip archive
tar -czvf archive_name.tar.gz directory # Compress a directory into a tar.gz archive
tar -xzvf archive_name.tar.gz # Extract a tar.gz archive
```

# Extract files from a zip archive
```bash
unzip archive_name.zip # Extract all files from a zip archive
unzip archive_name.zip -d destination_directory # Extract files to a specific directory
unzip -l archive_name.zip # List the contents of a zip archive
unzip -t archive_name.zip # Test the integrity of a zip archive
```

# Clear the terminal screen
```bash
clear # Clear the terminal screen
```

# View the contents of a file one screen at a time
```bash
less filename # View the contents of a file
```

# Find files and directories with root privileges
```bash
sudo find /path/to/search -name "filename" # Find files by name
sudo find /path/to/search -type d -name "directory_name" # Find directories by name
sudo find /path/to/search -type f -name "filename" # Find files by name
sudo find /path/to/search -exec rm {} \; # Find and delete files
```

# Open a file with the default application
```bash
xdg-open filename # Open a file with the default application (Linux)
```

# Kill a process by name
```bash
kill process_name # Kill a process by name
kill -9 process_name # Force kill a process by name
```