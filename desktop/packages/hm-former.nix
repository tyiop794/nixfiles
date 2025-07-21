{ config, lib, pkgs, inputs, ...}:
{
	environment.systemPackages = with pkgs; [
		neovim 
		mpv
		tmux
		stow
		kitty
		bat
	];
}
