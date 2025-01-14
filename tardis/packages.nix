{config, lib, pkgs, inputs, ... }:
{
    

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable gnome keyring
  security.pam.services.gdm.enableGnomeKeyring = true;
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    # gnome-terminal
    ptyxis
    gnome-power-manager
    gnome-themes-extra
    gnome-extension-manager
  ];

  # Exclude certain GNOME packages
  environment.gnome.excludePackages = with pkgs; [
    baobab      # disk usage analyzer
    cheese      # photo booth
    eog         # image viewer
    epiphany    # web browser
    gedit       # text editor
    simple-scan # document scanner
    totem       # video player
    yelp        # help viewer
    geary       # email client
    seahorse    # password manager
    gnome-console
    snapshot # camera program
    gnome-tour
    gnome-software

    # these should be self explanatory
    gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-contacts
    gnome-font-viewer gnome-logs gnome-maps gnome-music gnome-photos gnome-screenshot
    gnome-weather gnome-connections 
  ];
}
