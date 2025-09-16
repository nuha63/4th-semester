# PowerShell (pwsh) Command Guide

## What is PowerShell?
PowerShell (pwsh) is a cross-platform command-line shell and scripting language built on .NET. It's powerful for system administration, automation, and data processing tasks.

## How to Run PowerShell Commands

### 1. Starting PowerShell
```bash
# Open PowerShell interactive shell
pwsh

# Run a single PowerShell command
pwsh -Command "Get-Date"

# Execute a PowerShell script file
pwsh -File script.ps1
```

### 2. Basic PowerShell Commands

#### System Information
```powershell
# Get current date and time
Get-Date

# Get system information
Get-ComputerInfo

# Get running processes
Get-Process

# Get services
Get-Service
```

#### File and Directory Operations
```powershell
# List files in current directory
Get-ChildItem
# or use alias
ls

# Navigate to a directory
Set-Location /path/to/directory
# or use alias
cd /path/to/directory

# Create a new directory
New-Item -ItemType Directory -Name "NewFolder"

# Create a new file
New-Item -ItemType File -Name "newfile.txt"

# Copy files
Copy-Item "source.txt" "destination.txt"

# Move files
Move-Item "source.txt" "destination.txt"

# Delete files
Remove-Item "filename.txt"
```

#### Text Processing
```powershell
# Read file content
Get-Content "filename.txt"

# Search for text in files
Select-String "pattern" "filename.txt"

# Count lines in a file
(Get-Content "filename.txt").Count
```

### 3. Academic Use Cases

#### Database-related Tasks
```powershell
# Connect to SQL Server (if available)
# Install-Module -Name SqlServer
# Invoke-Sqlcmd -ServerInstance "localhost" -Query "SELECT * FROM Students"

# Process CSV files (common in database courses)
Import-Csv "data.csv" | Where-Object {$_.Grade -gt 80}
```

#### File Organization for Coursework
```powershell
# Organize files by extension
Get-ChildItem | Group-Object Extension | ForEach-Object {
    $folder = $_.Name.TrimStart('.')
    if ($folder) {
        New-Item -ItemType Directory -Name $folder -Force
        $_.Group | Move-Item -Destination $folder
    }
}

# Find large files (useful for managing PDF resources)
Get-ChildItem -Recurse | Where-Object {$_.Length -gt 10MB} | Sort-Object Length -Descending
```

#### Mathematical Calculations
```powershell
# Basic arithmetic
$result = 5 + 3 * 2
Write-Host "Result: $result"

# Generate random numbers
Get-Random -Minimum 1 -Maximum 100

# Calculate statistics
$numbers = 1,2,3,4,5,6,7,8,9,10
$sum = ($numbers | Measure-Object -Sum).Sum
$average = ($numbers | Measure-Object -Average).Average
Write-Host "Sum: $sum, Average: $average"
```

### 4. PowerShell Scripting Basics

#### Variables
```powershell
# Declare variables
$name = "Student"
$age = 20
$courses = @("Database", "DLD", "Math-221")

# Use variables
Write-Host "Hello, $name! You are $age years old."
```

#### Loops
```powershell
# For loop
for ($i = 1; $i -le 5; $i++) {
    Write-Host "Iteration $i"
}

# ForEach loop
$courses = @("Database", "DLD", "Math-221")
foreach ($course in $courses) {
    Write-Host "Course: $course"
}
```

#### Functions
```powershell
function Calculate-GPA {
    param(
        [int[]]$grades
    )
    $total = ($grades | Measure-Object -Sum).Sum
    $average = $total / $grades.Length
    return $average
}

# Usage
$myGrades = @(85, 90, 78, 92, 88)
$gpa = Calculate-GPA -grades $myGrades
Write-Host "Your GPA is: $gpa"
```

### 5. Useful PowerShell Aliases
```powershell
# Common aliases that work like bash commands
ls      # Get-ChildItem
cd      # Set-Location
pwd     # Get-Location
cat     # Get-Content
cp      # Copy-Item
mv      # Move-Item
rm      # Remove-Item
```

### 6. Getting Help
```powershell
# Get help for any command
Get-Help Get-Process
Get-Help Get-Process -Examples
Get-Help Get-Process -Full

# List all available commands
Get-Command

# Find commands related to a topic
Get-Command *file*
```

### 7. Exiting PowerShell
```powershell
# Exit PowerShell
exit
# or
quit
```

## Tips for Students
1. **Practice regularly**: Try running simple commands daily
2. **Use tab completion**: PowerShell has excellent tab completion
3. **Explore the help system**: Use `Get-Help` extensively
4. **Start simple**: Begin with basic file operations before moving to scripting
5. **Learn piping**: PowerShell's pipeline is very powerful for data processing

## Common Errors and Solutions
- **Execution Policy**: If you can't run scripts, use `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
- **Path issues**: Use absolute paths or check your current location with `Get-Location`
- **Permissions**: Some commands may require administrator privileges

This guide should help you get started with PowerShell for your academic work!