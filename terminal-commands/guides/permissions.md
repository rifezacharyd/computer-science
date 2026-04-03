# Permissions

## Understanding Permission Notation
```
-rwxr-xr--  =  Owner:rwx  Group:r-x  Others:r--
 |||
 ||+-- x: execute
 |+--- w: write
 +---- r: read
```

## chmod — Change Permissions
```bash
chmod 755 file.sh       # rwxr-xr-x (common for scripts)
chmod 644 file.txt      # rw-r--r-- (common for files)
chmod +x script.sh      # Add execute permission
chmod -w file.txt       # Remove write permission
chmod u+x file.sh       # Add execute for owner only
chmod -R 755 dir/       # Recursive
```

## chown — Change Ownership
```bash
chown user file.txt           # Change owner
chown user:group file.txt     # Change owner and group
chown -R user:group dir/      # Recursive
```

## umask — Default Permissions
```bash
umask                   # Show current umask
umask 022               # New files: 644, new dirs: 755
umask 077               # New files: 600, new dirs: 700 (private)
```
