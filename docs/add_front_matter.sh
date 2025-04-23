#!/bin/bash

# Add front matter to index.md (already done)

# Add front matter to all tutorial files
for file in [0-9]*.md; do
    if [ -f "$file" ]; then
        # Extract title from first line after removing markdown
        title=$(head -n 1 "$file" | sed 's/^# //')

        # Create front matter
        front_matter="---
layout: default
title: \"$title\"
nav_order: $(echo "$file" | cut -d'_' -f1)
---

"

        # Create temporary file with front matter
        echo "$front_matter" > temp_file

        # Append original content
        tail -n +2 "$file" >> temp_file

        # Replace original file
        mv temp_file "$file"
    fi
done