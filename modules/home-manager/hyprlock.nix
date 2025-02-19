{ config, pkgs, input, ... }:

{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                hide_cursor = true;
                grace = 3;
            };

            background = [{
                monitor = "";
                path = "screenshot";
                color = "rgba(121212aa)";
                blur_passes = 3;
                blur_size = 8;
                noise = 0.0;
                contrast = 1.0;
                brightness = 1.0;
                vibrancy = 0.25;
                vibrancy_darkness = 0.25;
            }];

            input-field = [{
                monitor = "";
                size = "225, 40";
                outline_thickness = 2;
                dots_size = 0.25;
                dots_spacing = 0.25;
                dots_center = true;
                outer_color = "rgb(505050)";
                inner_color = "rgb(f5f5f5)";
                font_color = "rgb(121212)";
                check_color = "rgb(757575)";
                fade_on_empty = false;
                placeholder_text = "<b><i><span foreground=\"##888888\">Enter password here</span></i></b>";
                hide_input = false;
                rounding = 4;
                position = "0, -50";
                halign = "center";
                valign = "center";
            }];

            label = [
                {
                    monitor = "";
                    text = "cmd[update:1000] echo \"$(date +\"%I:%M\")\"";
                    color = "rgb(f5f5f5)";
                    shadow_passes = 4;
                    shadow_size = 4;
                    shadow_color = "rgb(000000)";
                    font_size = 125;
                    font_family = "Berkeley Mono Bold";
                    position = "0, 100";
                    halign = "center";
                    valign = "center";
                }

                {
                    monitor = "";
                    text = "cmd[update:10000] echo \"$(date '+%A %d %B, %Y')\"";
                    color = "rgb(f5f5f5)";
                    shadow_passes = 1;
                    shadow_size = 4;
                    shadow_color = "rgb(000000)";
                    font_size = 16;
                    font_family = "Berkeley Mono Bold";
                    position = "0, 0";
                    halign = "center";
                    valign = "center";
                }

                {
                    monitor = "";
                    text = "cmd[update:10000] echo \"$(hyprctl splash)\"";
                    color = "rgb(f5f5f5)";
                    shadow_passes = 1;
                    shadow_size = 4;
                    shadow_color = "rgb(000000)";
                    font_size = 10;
                    font_family = "Berkeley Mono";
                    position = "0, 0";
                    halign = "center";
                    valign = "bottom";
                }
            ];
        };
    };
}