{ inputs, pkgs, ... }:

{
    programs.foot = {
        enable = true;
        settings = {
            main = {
                font = "Berkeley Mono:size=12";
                pad = "15x15";
            };
	    colors = {
		alpha = "1.0";
		background = "121212";
		foreground = "f5f5f5";

		# Normal colors
		regular0 = "121212"; # Black, could also be base01
		regular1 = "dd4400"; # Red
		regular2 = "aaaa00"; # Green
		regular3 = "ddaa44"; # Yellow
		regular4 = "7777dd"; # Blue
		regular5 = "aa7777"; # Megenta
		regular6 = "77aaaa"; # Cyan
		regular7 = "f5f5f5"; # White

		# Bright colors
		bright0 = "121212";
		bright1 = "dd4400";
		bright2 = "aaaa00";
		bright3 = "ddaa44";
		bright4 = "7777dd";
		bright5 = "aa7777";
		bright6 = "77aaaa";
		bright7 = "f5f5f5";
	    };
        };
    };
}
