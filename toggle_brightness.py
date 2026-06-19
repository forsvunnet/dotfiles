#!/usr/bin/env python3
"""Toggle the LG UltraFine display brightness to keep it awake.

Auto-detects the display by name. Runs forever, tolerating disconnects.
Requires: brew install m1ddc
"""

import subprocess
import time
import re

DISPLAY_NAME = "LG UltraFine"
INTERVAL = 30
RESCAN_DELAY = 10  # seconds to wait when the display is missing

def find_display_id():
    """Return the m1ddc display ID matching DISPLAY_NAME, or None."""
    try:
        out = subprocess.run(
            ["m1ddc", "display", "list"],
            check=True, capture_output=True, text=True,
        ).stdout
    except (subprocess.CalledProcessError, FileNotFoundError):
        return None
    for line in out.splitlines():
        m = re.match(r"\[(\d+)\]\s+(.*?)\s+\(", line)
        if m and DISPLAY_NAME.lower() in m.group(2).lower():
            return int(m.group(1))
    return None

def set_brightness(display_id, value):
    subprocess.run(
        ["m1ddc", "display", str(display_id), "set", "luminance", str(value)],
        check=True, capture_output=True,
    )

def main():
    print(f"Watching for '{DISPLAY_NAME}'. Ctrl+C to stop.")
    while True:
        display_id = find_display_id()
        if display_id is None:
            time.sleep(RESCAN_DELAY)
            continue
        print(f"Found '{DISPLAY_NAME}' as display {display_id}.")
        try:
            while True:
                set_brightness(display_id, 99)
                time.sleep(1)
                set_brightness(display_id, 100)
                time.sleep(INTERVAL)
        except subprocess.CalledProcessError:
            print("Display unreachable, rescanning.")
            time.sleep(RESCAN_DELAY)
        except KeyboardInterrupt:
            try:
                set_brightness(display_id, 100)
            except subprocess.CalledProcessError:
                pass
            print("\nStopped.")
            return

if __name__ == "__main__":
    main()
