{ config, pkgs, inputs, ... }:

{
    imports = [
        ./mako.nix
        ./hyprlock.nix
        ./hypridle.nix
        ./wofi.nix
        ./waybar.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

            # MONITORS
            monitor = ", 1920x1080, auto, 1.0";

            # AUTOSTART
            exec-once = [
                "hyprpaper"
                # "hypridle"
                "waybar"
                # "udiskie"
                "systemctl --user start plasma-polkit-agent"
                "wl-paste --watch cliphist store"
            ];

            # ENV VARIABLES
            env = [
                "MOZ_ENABLE_WAYLAND, 1"
            ];

            # LOOK AND FEEL
            general = {
                gaps_in = 5;
                gaps_out = 10;
                border_size = 0;
                
                layout = "dwindle";
            };

            decoration = {
                rounding = 8;
                inactive_opacity = 0.9;

                # drop_shadow = false;
                shadow = {
                    enabled = false;
                };
            };

            animations = {
                enabled = true;
                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

                animation = [
                    "windows, 1, 5, myBezier"
                    "windowsIn, 1, 5, myBezier, slide"
                    "windowsOut, 1, 5, myBezier, slide"
                    "border, 1, 5, default"
                    "borderangle, 1, 5, default"
                    "fade, 1, 5, default"
                    "workspaces, 1, 5, default"
                    "layers, 0"
                ];
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "master";
            };

            misc = {
                disable_hyprland_logo = true;
                force_default_wallpaper = 0;
                focus_on_activate = true;
            };

            # Input
            input = {
                kb_layout = "us";

                touchpad = {
                    clickfinger_behavior = true;
                };
            };

            gestures = {
                workspace_swipe = true;
            };

            # KEYBINDINGS
            "$mod" = "SUPER";

            bind = [
                "$mod, Return, exec, foot"
                "$mod, Q, killactive"
	    	    "$mod, M, exit"
                "$mod, F, togglefloating"
                "$mod, Escape, fullscreen"
		        "$mod, Space, exec, wofi -i -t foot"
                "$mod, V, exec, cliphist list | wofi -d  | cliphist decode | wl-copy"
                "$mod, P, exec, hyprpicker -a"
                "$mod, B, exec, firefox"

                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                "$mod, 0, workspace, 10"

                "$mod SHIFT, 1, movetoworkspace, 1"
                "$mod SHIFT, 2, movetoworkspace, 2"
                "$mod SHIFT, 3, movetoworkspace, 3"
                "$mod SHIFT, 4, movetoworkspace, 4"
                "$mod SHIFT, 5, movetoworkspace, 5"
                "$mod SHIFT, 6, movetoworkspace, 6"
                "$mod SHIFT, 7, movetoworkspace, 7"
                "$mod SHIFT, 8, movetoworkspace, 8"
                "$mod SHIFT, 9, movetoworkspace, 9"
                "$mod SHIFT, 0, movetoworkspace, 10"

                "$mod, mouse_down, workspace, e+1"
                "$mod, mouse_up, workspace, e-1"

                "$mod, Tab, cyclenext"
                "$mod, Tab, bringactivetotop"

                "$mod, P, pseudo"
                "$mod, S, togglesplit"

                ", switch:on:Lid Switch, exec, hyprlock"
            ];

            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            bindel = [
                ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
                ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            ];

            # WINDOWS AND WORKSPACES
            windowrulev2 = [
                "float, class:(mpv)"
                "float, class:(imv)"
                "float, class:(nm-connection-editor)"
                "float, class:(nwg-look)"
                "float, class:(.blueman-manager-wrapped)"
                "suppressevent maximize, class:.*"
            ];
        };
    };

    home.sessionVariables.NIXOS_OZONE_WL = "1";

    home.pointerCursor = {
        gtk.enable = true;
        # x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
    };

    gtk = {
        enable = true;

        theme = {
            package = pkgs.yaru-theme;
            name = "Yaru-prussiangreen-dark";
        };

        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
        };

        gtk3.extraConfig = {
            Settings = ''
                gtk-application-prefer-dark-theme=1
            '';
        };

        gtk4.extraConfig = {
            Settings = ''
                gtk-application-prefer-dark-theme=1
            '';
        };
    };

    services.cliphist.enable = true;
    services.udiskie.enable = true;
}
