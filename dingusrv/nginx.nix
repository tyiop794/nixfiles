{config, lib, pkgs, ...}:
{
    services.nginx = {
        enable = true;
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;
        # pulls in the hostname we set for nextcloud above (nextcloud.yourdomain.com)
        virtualHosts.${config.services.nextcloud.hostName} = {
          enableACME = true;
          acmeRoot = null;
          addSSL = true;
          # directs traffic to the appropriate port for nextcloud
          locations."/" = {
            proxyPass = "http://localhost:8080";
            proxyWebsockets = true;
          };
        };
  };

  security.acme = {
    acceptTerms = true;
    preliminarySelfsigned = false;
    defaults = {
      email = "acme@yourdomain.com";
      dnsProvider = "cloudflare";
      # API for authentication to DNA provider e.g.
      # CF_API_KEY=<insert-global-key>
      # CF_API_EMAIL=<insert-dns-account-email>
      # specify file if not using agenix
      credentialsFile = config.age.secrets.acmeCredentials.path;
    };
  };

  # allow nginx to configure acme
  users.users.nginx.extraGroups = [ "acme" ];

  # if providing credentialsFile via agenix
  age.secrets.acmeCredentials.file = ../../secrets/acmeCredentials.age;
}
