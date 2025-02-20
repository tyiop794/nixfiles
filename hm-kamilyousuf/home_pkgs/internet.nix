{config, pkgs, inputs, ...}:
{
    services.flatpak.packages = [
        "io.gitlab.librewolf-community"
        "io.github.ungoogled_software.ungoogled_chromium"
        "org.qbittorrent.qBittorrent"
        "org.torproject.torbrowser-launcher"
        "com.getpostman.Postman"
    ];
}
