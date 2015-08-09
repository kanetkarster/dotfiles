# get toucheen state
TOUCHSCREENSTATE=$(xinput list-props 'Atmel Atmel maXTouch Digitizer' | grep "Device Enabled" | awk '{print $4}')
# toggle state
if [ $TOUCHSCREENSTATE = 0 ]; then
    xinput enable 'Atmel Atmel maXTouch Digitizer'
elif [ $TOUCHSCREENSTATE = 1 ]; then
    xinput disable 'Atmel Atmel maXTouch Digitizer'
else
    echo "Couldn't get Touch Screen state"
    exit 1
fi
exit 0
