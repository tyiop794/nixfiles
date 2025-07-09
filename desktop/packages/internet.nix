{ config, lib, pkgs, inputs, ...}:
{
    environment.systemPackages = with pkgs; [
        brave
        firefox
        librewolf
        chromium
        # ungoogled-chromium
    ];
}
