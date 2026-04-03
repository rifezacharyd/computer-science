# Process Management

## ps — List Processes
```bash
ps aux                 # All processes (BSD style)
ps aux | grep python   # Find specific processes
ps -ef --forest        # Process tree (Linux)
```

## kill — Signal Processes
```bash
kill PID               # Send SIGTERM (graceful shutdown)
kill -9 PID            # Send SIGKILL (force kill)
kill -l                # List all signals
killall process_name   # Kill by name
pkill -f "pattern"     # Kill by pattern match
```

## jobs / bg / fg — Job Control
```bash
command &              # Run command in background
jobs                   # List background jobs
fg %1                  # Bring job 1 to foreground
bg %1                  # Resume job 1 in background
Ctrl+Z                 # Suspend current foreground process
```

## nohup — Persist After Logout
```bash
nohup long-command &   # Run even after terminal closes
nohup command > output.log 2>&1 &  # With output redirection
```
