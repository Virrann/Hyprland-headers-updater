#!/bin/bash
# hyprland-header-sync.sh
# Keep Hyprland headers in sync with your pacman installation

ORIGINAL_DIR=$(pwd)

URL="https://github.com/hyprwm/Hyprland"

# Path to your local Hyprland source clone
HYPR_DIR="$HOME/<were you whant to dowload source code>"

# -----------------------------
# Step 1: Get pacman version
# -----------------------------
PAC_VER_FULL=$(pacman -Q hyprland 2>/dev/null | awk '{print $2}')

if [ -z "$PAC_VER_FULL" ]; then
    echo "❌ Hyprland is not installed via pacman."
    exit 1
fi

# Strip everything after the first '-' to get the base version
PAC_VER=$(echo "$PAC_VER_FULL" | cut -d- -f1)

# ------------------------------------
# Step 2: Checks if the versions match
# ------------------------------------

TARBALL="hyprland-source-v$PAC_VER.tar.gz"

if [[ "$TARBALL" == *"$PAC_VER"* ]] && [[ -d "$HYPR_DIR/hyprland-source" ]]; then
    echo "Source tarball match pacman version ($PAC_VER). Nothing to do."
    return
else
    echo "Source version does not match pacman version. Proceeding to update headers..."
fi

# ------------------------------------
# Step 3: Download and extract source tarball
# ------------------------------------

mkdir -p "$HYPR_DIR"
cd "$HYPR_DIR"

DOWLOAD_URL="$URL/releases/download/v$PAC_VER/source-v$PAC_VER.tar.gz"

if [ ! -f "$TARBALL" ]; then
    echo "\nDownloading Hyprland source for version $PAC_VER..."
    echo "\n============================== curl =============================\n"
    curl -L -o "$TARBALL" "$DOWLOAD_URL"
else
    echo "\nSource tarball already exists: $TARBALL\n"
fi

# Extract tarball

echo "\n=========================== Extracting ===========================\n"
tar -xzf "$TARBALL" -C "$HYPR_DIR"

# ------------------------------------
# Step 3: Build headers
# ------------------------------------

echo "\n======================== Building headers ========================\n"

cd "$HYPR_DIR/hyprland-source"
make all
sudo make installheaders

cd "$ORIGINAL_DIR"

echo "\n============================== Done =============================\n"
