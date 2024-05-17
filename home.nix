{ config, inputs, pkgs, home-manager,... }:

{
  home.username = "kamilyousuf";
  home.homeDirectory = "/home/kamilyousuf";
  nixpkgs.config.allowUnfree = true;

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  imports = [
     ./home_pkgs.nix
     ./home_cfgs/gnome.nix
     ./home_cfgs/neovim.nix
     ./home_cfgs/firefox.nix
     ./home_cfgs/fish.nix
  ];
  home.stateVersion = "23.11";

  programs.bat = {
    enable = true;
    config = {
       theme = "gruvbox-dark";
    };
  };

  programs.mpv = {
    enable = true;
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
