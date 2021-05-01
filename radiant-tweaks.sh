RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

command=$(loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type)
if [ $command = 'Type=x11' ]; then
	echo -e "${GREEN}Choose your bar theme:"
	echo "blocks    colorblocks    cuts      docky
forest    grayblocks     hack      material
panels    pwidgets       shades    shapes
default"
	echo ""
	read polybar_theme
	if [ $polybar_theme = "default"  ]; then
		killall -q polybar
	        gnome-extensions disable hidetopbar@mathieu.bidon.ca
	else
	   gnome-extensions enable hidetopbar@mathieu.bidon.ca
	   bash ~/.config/polybar/launch.sh --$polybar_theme
	fi
else
	echo -e "${RED}Polybar doesn't work on wayland try switching to x11"
fi
