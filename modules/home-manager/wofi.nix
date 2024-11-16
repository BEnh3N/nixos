{ inputs, pkgs, ... }:

{
    programs.wofi = {
        enable = true;
        settings = {
            mode = "drun";
            hide_scroll = true;
            width = "25%";
            height = "50%";
            location = "center";
            no_actions = true;
            allow_images = true;
            image_size = 25;
        };
        style = ''
            * {
                all: unset;
                font-family: "Berkeley Mono";
                font-size: 18px;
            }

            window {
                background-color: rgba(18, 18, 18, 1.0);
                border: 2px solid rgba(128, 128, 128, 0.25);
                border-radius: 8px;
            }

            #entry {
                color: #303030;
                padding: 15px;
            }

            #entry:selected {
                color: #f5f5f5;
                padding-left: 20px;
            }

            #input {
                padding: 10px;
                margin: 10px;
            }
            image {
                color: #505050;
                padding-right: 15px;
            }
        '';
    };
}