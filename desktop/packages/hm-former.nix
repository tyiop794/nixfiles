{ config, lib, pkgs, inputs, ...}:
{
	environment.systemPackages = with pkgs; [
		neovim 
		mpv
                # mpvScripts.mpris
		tmux
		stow
		kitty
		bat
	];
}
