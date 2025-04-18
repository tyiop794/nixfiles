{config, inputs, ... }:
{
    programs.ssh = {
        enable = true;
        extraConfig = ''
            Host derecho
                HostName derecho.hpc.ucar.edu
                User kyousuf
            Host lotus
                HostName lotus.arc.rhodes.edu
                User youka-25
            Host box
                HostName 10.20.45.234
                User kamilyousuf
        '';
    };
}
