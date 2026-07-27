# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	[[ $mon = $(cat "${HOME}/.config/bspwm/src/config/.no_polybar_mon") ]] && continue
	(
        MONITOR=$mon polybar pam1 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar pam2 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar pam3 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar pam4 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar pam5 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar pam6 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
    )
done
