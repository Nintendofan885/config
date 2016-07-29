#!/usr/bin/osascript

tell application "System Events"
    tell appearance preferences
        set dark mode to true
        set appearance to graphite
        set highlight color to graphite
    end tell
    tell dock preferences
        set magnification size to 1.0
        set magnification to true
        set dock size to 0.44
        set autohide to true
    end tell
end tell

tell application "Finder"
    set all name extensions showing of Finder preferences to true
end tell
