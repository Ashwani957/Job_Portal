#!/bin/bash

# Script to fix JSTL taglib references in JSP files

echo "Fixing JSTL taglib references in JSP files..."

# Find all JSP files in the project
find src/main/webapp -name "*.jsp" | while read file; do
  echo "Processing $file..."
  
  # Replace jakarta.tags.core with http://java.sun.com/jsp/jstl/core
  sed -i 's/uri="jakarta\.tags\.core"/uri="http:\/\/java.sun.com\/jsp\/jstl\/core"/g' "$file"
  
  # Replace jakarta.tags.fmt with http://java.sun.com/jsp/jstl/fmt
  sed -i 's/uri="jakarta\.tags\.fmt"/uri="http:\/\/java.sun.com\/jsp\/jstl\/fmt"/g' "$file"
  
  # Replace jakarta.tags.functions with http://java.sun.com/jsp/jstl/functions
  sed -i 's/uri="jakarta\.tags\.functions"/uri="http:\/\/java.sun.com\/jsp\/jstl\/functions"/g' "$file"
  
  # Change taglib prefix if needed
  # sed -i 's/taglib uri="http:\/\/java.sun.com\/jsp\/jstl\/core"/taglib prefix="c" uri="http:\/\/java.sun.com\/jsp\/jstl\/core"/g' "$file"
done

echo "All JSP files processed!" 