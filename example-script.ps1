# Example PowerShell Script for Academic Use
# This script demonstrates basic PowerShell functionality

# Display welcome message
Write-Host "=== 4th Semester PowerShell Example ===" -ForegroundColor Green

# Get current date and time
$currentDate = Get-Date
Write-Host "Current Date: $currentDate" -ForegroundColor Yellow

# List course directories
Write-Host "`nCourse Directories:" -ForegroundColor Cyan
$courseDirectories = Get-ChildItem -Directory | Where-Object { $_.Name -match "Database|DLD|MATH|dld" }
foreach ($dir in $courseDirectories) {
    Write-Host "  - $($dir.Name)" -ForegroundColor White
}

# Show PDF resources
Write-Host "`nPDF Resources:" -ForegroundColor Cyan
$pdfFiles = Get-ChildItem -Filter "*.pdf"
foreach ($pdf in $pdfFiles) {
    $sizeKB = [math]::Round($pdf.Length / 1KB, 2)
    Write-Host "  - $($pdf.Name) ($sizeKB KB)" -ForegroundColor White
}

# Calculate total storage used by PDFs
$totalPdfSize = ($pdfFiles | Measure-Object -Property Length -Sum).Sum
$totalSizeMB = [math]::Round($totalPdfSize / 1MB, 2)
Write-Host "`nTotal PDF Size: $totalSizeMB MB" -ForegroundColor Magenta

# Simple GPA calculation example
Write-Host "`nExample GPA Calculation:" -ForegroundColor Cyan
$sampleGrades = @(85, 90, 78, 92, 88)
$averageGrade = ($sampleGrades | Measure-Object -Average).Average
Write-Host "Sample Grades: $($sampleGrades -join ', ')" -ForegroundColor White
Write-Host "Average Grade: $([math]::Round($averageGrade, 2))" -ForegroundColor White

Write-Host "`n=== Script Completed Successfully ===" -ForegroundColor Green