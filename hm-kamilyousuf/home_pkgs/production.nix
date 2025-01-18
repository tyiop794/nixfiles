{config, pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
        lmms
    ];
    services.flatpak.packages = [
        "com.github.finefindus.eyedropper"
        "org.inkscape.Inkscape"
        "org.gimp.GIMP"
        "org.kde.kdenlive"
    ];
}
