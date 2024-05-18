{config, inputs, pkgs, lib, ... }:
let
  fromGithub = import ./functions/fromGithub.nix;
in
{
  # My neovim configuration
  # (will be more complex later)
  imports = [
    ./colorscheme.nix
  ];
  programs.neovim = {
  	enable = true;
  	defaultEditor = true;
	plugins = with pkgs.vimPlugins; [
	   nvim-lspconfig
	   nvim-treesitter.withAllGrammars
	   plenary-nvim
	   vim-fugitive
	   (fromGithub {inherit pkgs; rev="ac7ad3c8e61630d15af1f6266441984f54f54fd2"; ref="HEAD"; user="elihunter173"; repo="dirbuf.nvim"; })
	];
  };
}