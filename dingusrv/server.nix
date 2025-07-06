{config, pkgs, ...}:
{

    imports = [
    # TODO: make this stuffs work
        ./sql.nix
        ./nextcloud.nix
    ];
    networking.firewall = {
        allowedTCPPorts = [ 80 443 ];
    };
}
