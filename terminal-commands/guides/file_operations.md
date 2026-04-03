# File Operations

## touch — Create Files
```bash
touch file.txt                # Create empty file (or update timestamp)
touch file1.txt file2.txt     # Create multiple files
```

## mkdir — Create Directories
```bash
mkdir mydir                   # Create directory
mkdir -p path/to/nested/dir   # Create nested directories
```

## cp — Copy
```bash
cp file.txt backup.txt        # Copy file
cp -r src/ dest/              # Copy directory recursively
cp -i file.txt dest/          # Prompt before overwrite
cp -v file.txt dest/          # Verbose (show what's copied)
```

## mv — Move / Rename
```bash
mv old.txt new.txt            # Rename file
mv file.txt /path/to/dest/    # Move file
mv -i src dest                # Prompt before overwrite
```

## rm — Remove
```bash
rm file.txt                   # Delete file
rm -r directory/              # Delete directory recursively
rm -i file.txt                # Prompt before delete
rm -f file.txt                # Force delete (no prompt)
```
