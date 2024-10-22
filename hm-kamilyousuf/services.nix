{ config, inputs, pkgs, home-manager,... }:

{
    systemd.user.services.home-manager-update = {
        Unit = {
            Description = "Update Home Manager packages automatically";
        };
        Service = {
            Type = "oneshot";
            ExecStart = "${config.home.homeDirectory}/nixfiles/scripts/hmu";
        };
        Install = {
            WantedBy = [ "timers.target" ];
        };
    };

    systemd.user.timers.home-manager-update = {
        Unit = {
            Description = "Run Home Manager updates daily";
        };
        Timer = {
            OnCalendar = "daily";
            Persistent = true;
        };
        Install = {
            WantedBy = [ "timers.target" ];
        };
    };

}
