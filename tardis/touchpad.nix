{ config, lib, pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
        touchegg
    ];

    services.touchegg.enable = true;
}
