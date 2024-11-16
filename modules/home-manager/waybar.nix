{ inputs, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                modules-left = [ "clock#time" "clock#date" ];
                modules-center = [ "hyprland/workspaces" ];
                modules-right = [ "network" "pulseaudio" "battery" "backlight" ];

                "clock#time" = {
                    format = " {:%I:%M %p}";
                    tooltip = false;
                };
                "clock#date" = {
                    format = " {:%a %d %b, %Y}";
                    tooltip = false;
                };
                "tray" = {
                    show-passive-items = true;
                };

                "network" = {
                    format = " {essid}";
                    format-ethernet = " Ethernet";
                    format-disconnected = " No Network";
                    tooltip-format = "{ipaddr}";
                };
                "pulseaudio" = {
                    format = " {volume:2}%";
                    # format-muted = " --%";
                };
                "battery" = {
                    format = "{icon} {capacity:2}%";
                    format-icons = [ "" "" "" "" "" ];
                    interval = 30;
                };
                "backlight" = {
                    format = " {percent:2}%";
                    tooltip = false;
                };
            };
        };
        style = ''
            * {
                /* `otf-font-awesome` is required to be installed for icons */
                font-family: "Berkeley Mono", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
                font-weight: bold;
                font-size: 14px;
            }

            window#waybar {
                background-color: #121212;
                color: #f5f5f5;
            }

            #workspaces button {
                padding: 0 20px;
                margin: 0 6px;

                transition-property: background, padding, color;
                transition-duration: 0.25s;

                background: rgba(245, 245, 245, 0.25);
                color: rgba(245, 245, 245, 0.75);

                border: none;
                border-radius: 4px;
            }

            #workspaces button:hover {
                background: rgba(245, 245, 245, 0.35);

                box-shadow: inherit;
                text-shadow: inherit;
            }

            #workspaces button.active {
                padding: 0 40px;
                color: #121212;
                background: linear-gradient(90deg, #c5cdda, #dfc7ab);
            }

            #clock,
            #battery,
            #backlight,
            #network,
            #pulseaudio,
            #tray {
                padding: 0 12px;
                margin: 12px 0px;
                color: #f5f5f5;
            }

            #window,
            #workspaces {
                margin: 12px 0;
            }

            #clock.date,
            #pulseaudio,
            #battery,
            #backlight,
            #tray {
                border-left: 2px solid rgba(245, 245, 245, 0.1);
            }

            #network {
            }

            #network.disconnected {
                color: rgba(245, 245, 245, 0.1);
            }

            #pulseaudio.muted {
                color: rgba(245, 245, 245, 0.1);
            }


            @keyframes blink {
                to {
                    color: #f5f5f5;
                }
            }

            /* Using steps() instead of linear as a timing function to limit cpu usage */
            #battery.critical:not(.charging) {
                color: #f53c3c;
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: steps(12);
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }

            label:focus {
                background-color: #000000;
            }
       '';
    };
}