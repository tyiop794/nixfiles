{config, pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
        lmms
        ardour
    ];
    services.flatpak.packages = [
        "com.github.finefindus.eyedropper"
        "org.inkscape.Inkscape"
        "org.gimp.GIMP"
        "org.kde.kdenlive"
        "com.unity.UnityHub"
        "com.jetbrains.Rider"
        "io.github.seadve.Kooha"
    ];
}
