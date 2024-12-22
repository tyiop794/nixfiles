{ config, inputs, pkgs, home-manager, flatpak_nixpkgs, ... }:

{
  home.username = "kamilyousuf";
  home.homeDirectory = "/home/kamilyousuf";
  nixpkgs.config.allowUnfree = false;

  nixpkgs.overlays = [
    # (self: super : {
    #     flatpak = flatpak_nixpkgs.flatpak;
    # })
  ];

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
     ./home_cfgs/neovim/neovim.nix
     ./home_cfgs/firefox.nix
     ./home_cfgs/fish.nix
     ./home_cfgs/tmux.nix
     ./home_cfgs/mpv.nix
     ./home_cfgs/ssh.nix
     ./services.nix
  ];
  home.stateVersion = "23.11";

  programs = { 
      bat = {
        enable = true;
        config = {
           theme = "gruvbox-dark";
        };
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;
      }; 
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
