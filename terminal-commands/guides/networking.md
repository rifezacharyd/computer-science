# Networking Commands

## curl — HTTP Client
```bash
curl https://example.com               # GET request
curl -o file.html https://example.com  # Save to file
curl -I https://example.com            # Headers only
curl -X POST -d "data" https://url     # POST request
curl -s https://ifconfig.me            # Get public IP
```

## wget — File Downloader
```bash
wget https://example.com/file.tar.gz   # Download file
wget -O output.txt https://url         # Custom output filename
wget -c https://url/large-file         # Resume interrupted download
```

## ping — Connectivity Check
```bash
ping google.com              # Continuous ping
ping -c 4 google.com         # 4 pings then stop
```

## ss — Socket Statistics (modern netstat)
```bash
ss -tuln                     # Show listening TCP/UDP ports
ss -tp                       # Show TCP connections with process info
```

## ip — Network Configuration (Linux)
```bash
ip addr show                 # Show all interfaces and addresses
ip route show                # Show routing table
```
