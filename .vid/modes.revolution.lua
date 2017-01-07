return {

	startup = {
		'xrandr --setprovideroutputsource modesetting NVIDIA-0',
		'xrandr --auto',
		'xrandr --newmode "1920x1080" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync',
		'xrandr --addmode eDP-1 1920x1080',
		'xset s off -dpms',
	},

	modes = {
		{
			name = "single",
			description = "single screen, high resolution",
			cmd = "--output eDP-1 --auto --output HDMI-1 --off",
			dpi = 192,
		},

		{
			name = "single-low",
			description = "single screen, low resolution",
			cmd = "--output eDP-1 --mode 1920x1080 --output HDMI-1 --off",
			dpi = 96,
		},

		{
			name = "proway-dev",
			description = "development @ proway",
			cmd = "--output eDP-1 --mode 1920x1080 --pos 0x360 --output HDMI-1 --auto --pos 1920x0",
			dpi = 96,
		},

		{
			name = "proway-beamer",
			description = "beamer @ proway",
			cmd = "--output eDP-1 --mode 1920x1080 --pos 0x1080 --output HDMI-1 --mode 1920x1080 --pos 0x0",
			dpi = 96,
		},

	},

	default = "single"

}

