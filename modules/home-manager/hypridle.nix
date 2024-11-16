{ pkgs, config, inputs, ... }:

{
    services.hypridle = {
        enable = true;
        settings = {
            listener = [
                {
                    timeout = 150;
                    on-timeout = "notify-send -a \"Hey!\" \"You've been idle for a while now...\"";
                    on-resume = "notify-send -a \"Hi!\" \"Welcome back!\"";
                }
                {
                    timeout = 170;
                    on-timeout = "notify-send -a \"Hey!\" \"Locking in 10 seconds...\"";
                }
                {
                    timeout = 180;
                    on-timeout = "hyprlock";
                }
                {
                    timeout = 240;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
                {
                    timeout = 300;
                    on-timeout = "systemctl suspend";
                }
            ];
        };
    };
}