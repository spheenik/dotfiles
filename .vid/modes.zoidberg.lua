return {

	startup = {
	},

	modes = {
		{
			name = "mirrored",
			description = "normal mirrored mode",
			cmd = "--output HDMI-3 --mode 1680x1050 --primary --output HDMI-2 --mode 1920x1080 --right-of HDMI-3",
			dpi = 96,
		},

		{
			name = "single",
			description = "single display on the left",
			cmd = "xrandr --output HDMI-3 --mode 1680x1050 --output HDMI-2 --off",
			dpi = 96,
		},
	},

	default = "mirrored"

}

