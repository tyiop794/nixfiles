{config, pkgs, inputs, ...}:
{
    services.flatpak.packages = [
        "fr.handbrake.ghb"
    ];
    home.packages = with pkgs; [
     jellyfin-media-player
     jellyfin-mpv-shim
     calibre
    ];
}
