{ pkgs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;

  virtualisation = {
    # podman = { # Let's not use this since it is not as well supported...
    #   enable = true;
    #
    #   # Create a `docker` alias for podman, to use it as a drop-in replacement
    #   dockerCompat = true;
    #
    #   # Required for containers under podman-compose to be able to talk to each other.
    #   defaultNetwork.settings.dns_enabled = true;
    # };

    docker = {
        enable = true;
    };
  };

  # Useful otherdevelopment tools
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    docker-compose # start group of containers for dev
    distrobox
    #podman-compose # start group of containers for dev
  ];
}
