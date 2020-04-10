return {

	startup = {
		"setxkbmap -layout de",
		"xset m 0/1 4"
	},

	modes = {
		{
			name = "standard",
			description = "normal mode",
			cmd = "--output HDMI-A-0 --mode 1920x1080 --primary --output DisplayPort-0 --mode 2560x1440 --right-of HDMI-A-0",
			scale = 1,
		},

		{
			name = "single",
			description = "single display on the left",
			cmd = "--output HDMI-A-0 --mode 1920x1080 --primary --output DisplayPort-0 --off",
			scale = 1,
		},

		{
			name = "single-right",
			description = "single display on the right",
			cmd = "--output HDMI-A-0 --off --output DisplayPort-0 --mode 2560x1440",
			scale = 1,
		},

	},

	default = "standard"

}

