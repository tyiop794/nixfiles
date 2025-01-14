{config, pkgs, inputs, ...};
{
    services.flatpak.packages = [
        "dev.geopjr.Tuba"
        "com.discordapp.Discord"
        "us.zoom.Zoom"
        "com.slack.Slack"
        "com.rtosta.zapzap"
    ];
}
