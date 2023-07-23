![beepberry(beepberry.jpg)

# Battery Monitoring and Logging with Gnuplot and Dialog for beepberry 

This repository contains scripts to monitor and log battery status on beepberry system. The battery status is checked and logged periodically, and a gnuplot script is used to visualize the logged data. The user can interactively select a range for the plot using a text-based menu.

## Scripts

- `bat.sh`: This script checks the battery status. Copy this to `/usr/bin/bat.sh`.
- `batlog.sh`: This script calls `bat.sh` and logs the output in a specified log file. Copy this to `/usr/sbin/batlog.sh`.
- `batmon.sh`: This script visualizes the logged data using gnuplot. The user can interactively select a range for the plot using dialog. Copy this to `/usr/bin/batmon.sh`.
- `install.sh`: This script installs the necessary dependencies and sets up the scripts.

## Installation

1. Clone the repository:
   ```bash
  
   git clone git@github.com:dzaczek/beepbeery_power_plot.git
   cd beepbeery_power_plot
   ```
   Replace `username` and `repo` with your GitHub username and repository name.

2. Run the install script:
   ```bash
   ./install.sh
   ```

   This script will do the following:
   - Install the necessary dependencies: gnuplot and dialog.
   - Add a crontab entry to run `batlog.sh` every minute.
   - Copy the scripts to their respective locations.

## Usage

To monitor the battery status and visualize the logged data, simply run:

```bash
batmon.sh
```

You can then use the up and down arrow keys to select a range for the plot, and press Enter to confirm your selection.

---
