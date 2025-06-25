{config, lib, pkgs, ...}:
{
    environment.etc."nextcloud-admin-pass".text = "hello_world_365";
    services.nextcloud = {
        package = pkgs.nextcloud31;
        enable = true;
        # specify either a domain you own or localhost
        hostName = "localhost";
        autoUpdateApps.enable = true;
        https = true;
        settings.trusted_domains = ["192.168.1.213"];
        # only specify caching if using redis or alternative service
        # caching.redis = true;
        config = {
          # only specify dbtype if using postgresql db
          dbtype = "pgsql";
          dbname = "nextcloud";
          dbuser = "nextcloud";
          # default directory for postgresql, ensures automatic setup of db
          dbhost = "/run/postgresql";
          adminuser = "admin";
          # specified using agenix, provide path to file as alternative
          adminpassFile = "/etc/nextcloud-admin-pass";
          # adminpassFile = config.age.secrets.nextcloudPass.path;
          # error thrown unless specified
          defaultPhoneRegion = "US";
        };
    # specify only if you want redis caching
    };    
}
