# Discalimer

if you run `hyprpm update` looks like they update headers automatically, but has noting saying it on doc, so I made this script just in case

# Hyprland Header Sync

`hyprland-header-sync.sh` is a Bash script to keep the Hyprland headers in sync with the version installed via Pacman on Arch Linux or Arch-based distributions. This is especially useful if you want to develop plugins and need the correct headers for compilation.


## Features

- Automatically detects the installed Hyprland version via Pacman.
- Downloads the matching source tarball from the official GitHub releases.
- Extracts the source code to a specified directory.
- Builds and installs headers required for plugin development.
- Returns the user to the original directory after execution.



## Requirements

- `curl` command-line tool
- `make` and `sudo` privileges for header installation


## Installation

1. Clone or download this repository:

```bash
git clone <your-repo-url>
cd <repo-directory>
```

2. Make the script executable:

```bash
chmod +x hyprland-header-sync.sh
```

3. Edit the `HYPR_DIR` var on script to set your preferred source directory:

```bash
HYPR_DIR="$HOME/<were you whant to dowload source code>"
```

## Usage

Run the script:

```bash
./hyprland-header-sync.sh
```

The script will:

1. Check the installed Hyprland version via Pacman.

2. Verify if the source directory and tarball match the installed version.

3. If not, download the corresponding source tarball from GitHub.

4. Extract the tarball into the specified directory.

5. Build and install the headers required for plugin development.

6. Return the terminal to the original directory.

## Example Output

```bash
Source tarball match pacman version (0.50.1). Nothing to do.
```

or, if headers need updating:

```bash

Source version does not match pacman version. Proceeding to update headers...

Downloading Hyprland source for version 0.50.1...

============================== curl =============================

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 51.7M  100 51.7M    0     0  39.9M      0  0:00:01  0:00:01 --:--:-- 46.3M

=========================== Extracting ===========================


======================== Building headers ========================

[Build messages, a lot of them]

============================== Done =============================

```
