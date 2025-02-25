{config, lib, pkgs, inputs, ...}:
{
  # Enable and configure TLP
  services.tlp = {
    enable = true;
    settings = {
        PLATFORM_PROFILE_ON_AC = "balanced";
        PLATFORM_PROFILE_ON_BAT = "low-power";
    };
  };

  services.power-profiles-daemon.enable = false;
}
