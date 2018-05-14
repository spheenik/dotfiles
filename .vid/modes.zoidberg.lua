return {

	startup = {
		"setxkbmap -layout de"
	},

	modes = {
		{
			name = "mirrored",
			description = "normal mirrored mode",
			cmd = "--output HDMI-3 --mode 1680x1050 --primary --output HDMI-1 --mode 1920x1080 --right-of HDMI-3 --output HDMI-2 --off",
			scale = 1,
		},

		{
			name = "single",
			description = "single display on the left",
			cmd = "--output HDMI-3 --mode 1680x1050 --output HDMI-1 --off --output HDMI-2 --off",
			scale = 1,
		},
	},

	default = "mirrored"

}

