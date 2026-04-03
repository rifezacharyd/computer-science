# System Information

## uname — System Identity
```bash
uname -a          # All system info
uname -r          # Kernel version
uname -m          # Machine architecture
```

## df — Disk Space
```bash
df -h             # Disk usage (human-readable)
df -h /           # Root partition only
```

## du — Directory Sizes
```bash
du -sh .          # Size of current directory
du -sh *          # Size of each item in current directory
du -sh * | sort -rh  # Sorted by size (largest first)
```

## free — Memory Usage (Linux)
```bash
free -h           # Memory usage (human-readable)
```

## top / htop — Process Monitor
```bash
top               # Real-time process viewer
htop              # Interactive process viewer (better UI)
# In htop: F6=sort, F9=kill, F5=tree view, q=quit
```
