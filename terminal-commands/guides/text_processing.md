# Text Processing

## cat — Display File Contents
```bash
cat file.txt                  # Print entire file
cat file1.txt file2.txt       # Concatenate files
cat -n file.txt               # Show line numbers
```

## less — Page Through Files
```bash
less file.txt                 # Open file in pager
# Navigation: Space=next page, b=back, /=search, q=quit
```

## grep — Search Text
```bash
grep "pattern" file.txt       # Search for pattern
grep -r "pattern" .           # Recursive search in directory
grep -i "pattern" file.txt    # Case-insensitive
grep -n "pattern" file.txt    # Show line numbers
grep -c "pattern" file.txt    # Count matches
grep -v "pattern" file.txt    # Invert (show non-matching lines)
grep -E "regex" file.txt      # Extended regex
```

## sed — Stream Editor
```bash
sed 's/old/new/' file.txt     # Replace first occurrence per line
sed 's/old/new/g' file.txt    # Replace all occurrences
sed -i 's/old/new/g' file.txt # Edit file in-place
sed -n '5,10p' file.txt       # Print lines 5-10
sed '/pattern/d' file.txt     # Delete lines matching pattern
```

## awk — Pattern Processing
```bash
awk '{print $1}' file.txt     # Print first column
awk -F: '{print $1}' /etc/passwd  # Custom delimiter
awk '{sum += $1} END {print sum}' file.txt  # Sum a column
awk 'NR >= 5 && NR <= 10' file.txt  # Print lines 5-10
```
