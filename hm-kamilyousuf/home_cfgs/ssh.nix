{config, inputs, ... }:
{
    programs.ssh = {
        enable = true;
        extraConfig = ''
            Host derecho
                HostName derecho.hpc.ucar.edu
                User kyousuf
        ''
    };
}
