{ config, inputs, pkgs, home-manager,... }:

{
    systemd.user.services.home-manager-update = {
        Unit = {
            Description = "Update Home Manager packages automatically";
        };
        Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.home-manager}/bin/home-manager switch";
        };
        Install = {
            WantedBy = [ "timers.target" ];
        };
    };

    systemd.user.timers.home-manager-update = {
        Unit = {
            Description = "Run Home Manager updates daily"
        };
        Timer = {
            OnCalendar = "daily";
            Persistent = true;
        };
        Install = {
            WantedBy = [ "timers.target" ];
        };
    };

    systemd.user.services.home-manager-update.serviceConfig.StandardOutput = "append:%h/.local/share/home-manager-update.log";
    systemd.user.services.home-manager-update.serviceConfig.StandardError = "append:%h/.local/share/home-manager-update.log";

}
