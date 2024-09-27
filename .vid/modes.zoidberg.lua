return {

	startup = {
		"setxkbmap -layout de",
		"xset m 0/1 4"
	},

	modes = {
		{
			name = "standard",
			description = "normal mode",
			cmd = "--output DisplayPort-0 --mode 2560x1440 --rate 69.92 --primary --output HDMI-A-0 --mode 1920x1080 --right-of DisplayPort-0",
			scale = 1,
		},

		{
			name = "single",
			description = "single display on the left",
			cmd = "--output HDMI-A-0 --mode 1920x1080 --primary --output DisplayPort-0 --off",
			scale = 1,
		},

	},

	default = "standard"

}

