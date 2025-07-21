{ config, lib, pkgs, inputs, ...}:
{
    environment.systemPackages = with pkgs; [
        brave
        firefox
        # librewolf
        chromium
        vulkan-loader # use to get hardware acceleration in chromium
        # google-chrome
    ];
}
