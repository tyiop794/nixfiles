{config, inputs, ... }:
{
  programs.fish = {
  	enable = true;
	shellInit = 
	    "
	       if status is-interactive
	            # stuff
	       end

	       set fish_greeting
	       set -g fish_key_bindings fish_vi_key_bindings

	       fish_add_path /home/kamilyousuf/nixfiles/scripts
               fish_add_path /usr/local/gcc-arm-none-eabi-4_7-2013q3/bin
	    ";
	shellAliases = {
	   ardb = "distrobox enter arch-toolbox-latest";
	   ndev = "nix develop";
           rvpn = "FUCKFORTICLIENT_OPTS=\"--trusted-cert bc40094ce61c62ac08e814405d5a9126b5c2216fde56157a79ac10caeea61b9b\" ~/fuckForticlient/fuckForticlient.sh -S edge.rhodes.edu:10443 -c";
	};
  };
}
