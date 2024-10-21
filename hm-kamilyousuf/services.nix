{ config, inputs, pkgs, home-manager,... }:

{
    systemd.user.services.home-manager-update = {
        # description = "Update Home Manager packages automatically";
        serviceConfig = {
            Type = "oneshot";
            ExecStart = "${config.home.sessionVariables.NIXPKGS_PATH}/bin/home-manager switch";
        };
        wantedBy = [ "timers.target" ];
    };

    systemd.user.timers.home-manager-update = {
        # description = "Run Home Manager updates daily";
        timerConfig = {
            OnCalendar = "daily";
            Persistent = true;
        };
        wantedBy = [ "timers.target" ];
    };

    systemd.user.services.home-manager-update.serviceConfig.StandardOutput = "append:%h/.local/share/home-manager-update.log";
    systemd.user.services.home-manager-update.serviceConfig.StandardError = "append:%h/.local/share/home-manager-update.log";

}
