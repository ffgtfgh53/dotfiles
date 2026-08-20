#############################
#	   Thinkpad Theme		#
#############################

#Catpuccin-Mocha

rosewater="#f5e0dc"
flamingo="#f2cdcd"
pink="#f5c2e7"
mauve="#cba6f7"
red="#f38ba8"
maroon="#eba0ac"
peach="#fab387"
yellow="#f9e2af"
green="#a6e3a1"
teal="#94e2d5"
sky="#89dceb"
sapphire="#74c7ec"
blue="#89b4fa"
lavender="#b4befe"
text="#cdd6f4"
subtext1="#bac2de"
subtext0="#a6adc8"
overlay2="#9399b2"
overlay1="#7f849c"
overlay0="#6c7086"
surface2="#585b70"
surface1="#45475a"
surface0="#313244"
base="#1e1e2e"
mantle="#181825"
crust="#11111b"
transparent="#FF00000"

black=$surface1
blackb=$surface2
red=$red
redb=$red
yellow=$yellow
yellowb=$yellowb
blue=$blue
blueb=$blue
magenta=$pink
magentab=$pink
cyan=$teal
cyanb=$teal
white=$subtext1
whiteb=$subtext0

bg=$base
fg=$text

accent_color=$base
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="2"		# Bspwm border
TOP_PADDING="53"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"
NORMAL_BC="$overlay0"		# Normal border color
FOCUSED_BC="$overlay2"	# Focused border color
ACTIVE_BC="$lavender"

# Terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="true"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="6"			# Corner radius (0 = disabled)
P_BLUR="false"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="0.9"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(28, 65)'
dunst_origin='top-right'
dunst_transparency='9'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'
dunst_frame_color="$blue"
dunst_icon_theme="Gruvbox-Plus-Dark"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$blue"
jg_sel_fg="$fg"
jg_sep="$blue"

# Rofi menu font and colors
rofi_font="Terminess Nerd Font Mono Bold 10"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$blue"
rofi_active="$green"
rofi_urgent="$red"

# Screenlocker
sl_bg="${bg}"
sl_fg="${blue}"
sl_ring="${bg}"
sl_wrong="${red}"
sl_date="${blue}"
sl_verify="${green}"

# Gtk theme
gtk_theme="CatppuccinMocha-zk"
gtk_icons="Catpuccin-Mocha"
gtk_cursor="Qogirr-Dark"
geany_theme="catppuccin-mocha"

# Wallpaper engine
# Available engines:
# - Theme	(Set a random wallpaper from rice directory)
# - CustomDir	(Set a random wallpaper from the directory you specified)
# - CustomImage	(Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
# - Slideshow (Change randomly every 15 minutes your wallpaper from Walls rice directory)
ENGINE="Slideshow"
