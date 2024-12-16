{ config, lib, pkgs, inputs, ... }:
{
	services.samba = {
	  enable = true;
	  securityType = "user";
	  openFirewall = true;
	  settings = {
	    "public" = {
	      "path" = "/drive";
	      "browseable" = "yes";
	      "read only" = "no";
	    };
	  };
	};
}
