{ config, pkgs, input, ... }:

{
    services.mako = {
        enable = true;

        font = "Berkeley Mono 12";
        backgroundColor = "#121212ff";
        textColor = "#f5f5f5ff";

        width = 300;
        height = 250;
        margin = "4,0";
        padding = "8";

        borderSize = 3;
        borderColor = "#363636ff";
        borderRadius = 8;

        progressColor = "over #5588aaff";
        
        icons = true;
        maxIconSize = 64;

        markup = true;
        actions = true;

        format = "<b>%s</b>\\n%b";

        defaultTimeout = 5000;
        ignoreTimeout = false;

        maxVisible = 3;

        output = "eDP-1";
        layer = "overlay";
        anchor = "bottom-right";

        extraConfig = ''
            outer-margin=4
            on-notify=exec pw-play $HOME/.config/mako/notification.wav
        '';
    };

    home.file.".config/mako/notification.wav".source = ./notification.wav;
}