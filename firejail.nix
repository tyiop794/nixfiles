{ config, lib, pkgs, inputs, ... }:

{
  # Enable firejail
  programs.firejail = {
      enable = true;
      wrappedBinaries = {
        /*
        firefox = {
            executable = "${pkgs.firefox}/bin/firefox";
            profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
            extraArgs = [
                "--ignore=private-dev"
                "--dbus-user.talk=org.freedesktop.Notifications" 
                "--env=GTK_THEME=Adwaita:dark"
            ];
        };
        */
        discord = {
            executable = "${pkgs.discord}/bin/discord";
            profile = "${pkgs.firejail}/etc/firejail/discord.profile";
        };
      };
  };
}
