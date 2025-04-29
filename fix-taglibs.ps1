# PowerShell script to fix JSTL taglib references in JSP files

Write-Host "Fixing JSTL taglib references in JSP files..." -ForegroundColor Green

# Find all JSP files in the project
$jspFiles = Get-ChildItem -Path "src\main\webapp" -Filter "*.jsp" -Recurse

foreach ($file in $jspFiles) {
    Write-Host "Processing $($file.FullName)..." -ForegroundColor Cyan
    
    $content = Get-Content -Path $file.FullName -Raw
    
    # Replace jakarta.tags.core with http://java.sun.com/jsp/jstl/core
    $content = $content -replace 'uri="jakarta\.tags\.core"', 'uri="http://java.sun.com/jsp/jstl/core"'
    
    # Replace jakarta.tags.fmt with http://java.sun.com/jsp/jstl/fmt
    $content = $content -replace 'uri="jakarta\.tags\.fmt"', 'uri="http://java.sun.com/jsp/jstl/fmt"'
    
    # Replace jakarta.tags.functions with http://java.sun.com/jsp/jstl/functions
    $content = $content -replace 'uri="jakarta\.tags\.functions"', 'uri="http://java.sun.com/jsp/jstl/functions"'
    
    # Write the modified content back to the file
    Set-Content -Path $file.FullName -Value $content
}

Write-Host "All JSP files processed!" -ForegroundColor Green 