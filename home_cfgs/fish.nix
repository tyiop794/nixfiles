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
	    ";
	shellAliases = {
	   ardb = "distrobox enter arch-toolbox-latest";
	   ndev = "nix develop";
	};
  };
}
