{ config, lib, pkgs, inputs, ...}:
{
    environment.systemPackages = with pkgs; [
        brave
        firefox
        chromium
        ungoogled-chromium
    ];
}
