                                              System Health Check Script (healthcheck.sh)

This project automates Linux system monitoring by collecting real-time health data such as uptime, CPU load, memory, disk usage, and running service status.  
It generates a timestamped log file for easy auditing.


# Features:

Displays system date and time  
Shows system uptime  
Reports CPU load averages  
Displays memory and disk usage  
Lists top 5 memory-consuming processes  
Checks status of essential services (nginx, ssh, docker)  
Logs everything into a timestamped file (e.g., `healthlog_2025-10-28_12-45-30.txt`)

# How to Use

1️ Give execute permission:

chmod +x healthcheck.sh


2️ Run the script:

./healthcheck.sh


3️ View the log file:

After running, the script automatically generates a log file in the same folder.

# Example:

healthlog_2025-10-28_12-45-30.txt

# Sample Output

==================== SYSTEM HEALTH CHECK ====================

Date and Time: Wed Oct 29 12:48:40 IST 2025
--------------------------------------------------------------
System Uptime: up 3 days, 4:23
--------------------------------------------------------------
CPU Load: 0.02, 0.04, 0.01
--------------------------------------------------------------
Memory Usage: Free 1101MB / Total 7982MB
--------------------------------------------------------------
Disk Usage: 42% used
--------------------------------------------------------------
Top 5 Memory-Consuming Processes:
  PID USER      %MEM COMMAND

  102 root      2.1  python3
  
  210 mysql     1.3  mysqld
  
  305 nginx     0.9  nginx
  
--------------------------------------------------------------
Service Status Check:

nginx  | ssh  | docker 
--------------------------------------------------------------
Log saved to: healthlog_2025-10-29_12-48-40.txt

==================== END OF REPORT ===========================

 # How It Works:

I* The script uses standard Linux commands to gather system metrics:

 *  date → shows current date and time

*  uptime → shows how long the system has been running

* free -m → checks memory usage in MB

* df -h → shows disk space usage

* ps aux --sort=-%mem | head -n 6 → lists top memory-consuming processes

* systemctl is-active → checks if services like nginx, ssh, and docker are running

* All this data is formatted and saved into a log file with the current date and time.

 # Example Use Case:

* You can use this script to:

* Monitor server health automatically

* Schedule daily checks using cron jobs

* Keep historical logs for troubleshooting and audits

* Example cron job (runs every day at 9 AM):

* 0 9 * * * /path/to/healthcheck.sh

 # Repository Setup:

<> To clone and run this project:

* git clone https://github.com/vempatisriram6-dev/healthcheck.git

* cd healthcheck

* chmod +x healthcheck.sh

* ./healthcheck.sh

 # Author

Developed by: Vempati Sriram

 GitHub: @vempatisriram6-dev







