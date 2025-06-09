{config, pkgs, ...}:
{
    services.nginx = {
        enable = true;
        virtualHosts.localhost = {
            locations."/" = {
                return = "200 '<html><body>It works</body></html>'";
                extraConfig = ''
                    default_type text/html;
                '';
            };
        };
    };

    networking.firewall = {
        allowedTCPPorts = [ 80 443 ];
    };
}
