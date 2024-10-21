{ config, inputs, pkgs, home-manager,... }:

{
    systemd.user.services.home-manager-update = {
        serviceConfig = {
            Description = "Update Home Manager packages automatically";
            Type = "oneshot";
            ExecStart = "${pkgs.home-manager}/bin/home-manager switch";
        };
        wantedBy = [ "timers.target" ];
    };

    systemd.user.timers.home-manager-update = {
        timerConfig = {
            Description = "Run Home Manager updates daily";
            OnCalendar = "daily";
            Persistent = true;
        };
        wantedBy = [ "timers.target" ];
    };

    systemd.user.services.home-manager-update.serviceConfig.StandardOutput = "append:%h/.local/share/home-manager-update.log";
    systemd.user.services.home-manager-update.serviceConfig.StandardError = "append:%h/.local/share/home-manager-update.log";

}
