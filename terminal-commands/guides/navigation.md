# Navigation Commands

## pwd — Print Working Directory
```bash
pwd                    # Show current directory path
```

## cd — Change Directory
```bash
cd /path/to/dir        # Go to absolute path
cd relative/path       # Go to relative path
cd ~                   # Go to home directory
cd -                   # Go to previous directory
cd ..                  # Go up one level
cd ../..               # Go up two levels
```

## ls — List Directory Contents
```bash
ls                     # Basic listing
ls -l                  # Long format (permissions, size, date)
ls -la                 # Include hidden files
ls -lh                 # Human-readable file sizes
ls -lt                 # Sort by modification time
ls -lS                 # Sort by file size
ls -R                  # Recursive listing
```

## find — Search for Files
```bash
find . -name "*.py"              # Find by name pattern
find . -type f -mtime -7         # Files modified in last 7 days
find . -type d -name "test*"     # Directories matching pattern
find . -size +100M               # Files larger than 100MB
find . -name "*.log" -delete     # Find and delete
```
