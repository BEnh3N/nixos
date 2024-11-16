{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/foot.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bennett";
  home.homeDirectory = "/home/bennett";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        {
          type = "host";
          format = "{/2}{-}{/}{2}{?3} {3}{?}";
        }
        "kernel"
        "uptime"
        {
          type = "battery";
          format = "{/4}{-}{/}{4}{?5} [{5}]{?}";
        }
        "break"
        "packages"
        "shell"
        "display"
        "terminal"
        "break"
        "cpu"
        {
          type = "gpu";
          key = "GPU";
        }
        "memory"
        "break"
        "colors"
      ];
    };
  };
  
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/nixos/flowerz.jpg";
      wallpaper = ", ~/nixos/flowerz.jpg";
    };
  };
}
