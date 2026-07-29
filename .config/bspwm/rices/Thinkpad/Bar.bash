# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	[[ $mon = $(cat "${HOME}/.config/bspwm/src/config/.no_polybar_mon") ]] && continue
	(
    MONITOR=$mon polybar bar1 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar bar2 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar bar3 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar bar4 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar bar5 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
    )
done
