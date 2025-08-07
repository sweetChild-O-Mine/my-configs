#!/bin/bash
# Battery monitoring script with notifications

BATTERY_PATH="/sys/class/power_supply/BAT0"
LOW_BATTERY=20
CRITICAL_BATTERY=10
VERY_CRITICAL=5

# Check if battery exists
if [[ ! -d "$BATTERY_PATH" ]]; then
    echo "Battery not found at $BATTERY_PATH"
    exit 1
fi

# Function to get battery percentage
get_battery_level() {
    cat "$BATTERY_PATH/capacity" 2>/dev/null || echo "100"
}

# Function to check if charging
is_charging() {
    local status=$(cat "$BATTERY_PATH/status" 2>/dev/null)
    [[ "$status" == "Charging" || "$status" == "Full" ]]
}

# Function to send notification
send_notification() {
    local level="$1"
    local message="$2"
    local urgency="$3"
    local icon="$4"
    
    # Send desktop notification
    notify-send -u "$urgency" -i "$icon" "Battery Alert" "$message" -t 5000
    
    # Also beep for critical alerts
    if [[ "$urgency" == "critical" ]]; then
        paplay /usr/share/sounds/alsa/Front_Left.wav 2>/dev/null || \
        speaker-test -t sine -f 1000 -l 1 -s 1 2>/dev/null || \
        echo -e "\a"  # Terminal bell as fallback
    fi
}

# Main monitoring loop
while true; do
    BATTERY_LEVEL=$(get_battery_level)
    
    # Skip if charging
    if is_charging; then
        sleep 30
        continue
    fi
    
    echo "Battery: $BATTERY_LEVEL%"
    
    # Critical alerts
    if [[ $BATTERY_LEVEL -le $VERY_CRITICAL ]]; then
        send_notification "$BATTERY_LEVEL" "⚠️ CRITICAL: $BATTERY_LEVEL%! System will shutdown in 2 minutes!" "critical" "battery-caution"
        
        # Auto-save and hibernate after 2 minutes if still critical
        sleep 120
        CURRENT_LEVEL=$(get_battery_level)
        if [[ $CURRENT_LEVEL -le $VERY_CRITICAL ]] && ! is_charging; then
            # Emergency save and suspend
            sync
            systemctl suspend
        fi
        
    elif [[ $BATTERY_LEVEL -le $CRITICAL_BATTERY ]]; then
        send_notification "$BATTERY_LEVEL" "⚠️ CRITICAL: $BATTERY_LEVEL%! Please charge immediately!" "critical" "battery-caution"
        sleep 60  # Check every minute when critical
        
    elif [[ $BATTERY_LEVEL -le $LOW_BATTERY ]]; then
        send_notification "$BATTERY_LEVEL" "🔋 Low Battery: $BATTERY_LEVEL%! Please plug in charger." "normal" "battery-low"
        sleep 120  # Check every 2 minutes when low
        
    else
        sleep 300  # Check every 5 minutes when normal
    fi
done