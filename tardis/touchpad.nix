{ config, lib, pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
        touchegg
        touche
    ];

    services.touchegg.enable = true;
}
