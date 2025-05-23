{ config, lib, pkgs, inputs, ...}:
{
    environment.systemPackages = with pkgs; [
        librewolf
        brave
        firefox
        chromium
        ungoogled-chromium
    ];
}
