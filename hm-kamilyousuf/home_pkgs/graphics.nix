{config, pkgs, inputs, ...}:
{
    services.flatpak.packages = [
        "com.github.finefindus.eyedropper"
        "org.inkscape.Inkscape"
        "org.gimp.GIMP"
        "org.kde.kdenlive"
    ];
}
