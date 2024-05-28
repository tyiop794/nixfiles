{config, inputs, pkgs, lib, ... }:
let
  fromGithub = import ./functions/fromGithub.nix;
in
{
  # My neovim configuration
  # (will be more complex later)
  imports = [
    ./colorscheme.nix
    ./lsp.nix
  ];
  programs.neovim = {
  	enable = true;
  	defaultEditor = true;
	plugins = with pkgs.vimPlugins; [
	   plenary-nvim
	   vim-fugitive
	   vimtex
	   (fromGithub {inherit pkgs; rev="ac7ad3c8e61630d15af1f6266441984f54f54fd2"; ref="HEAD"; user="elihunter173"; repo="dirbuf.nvim"; })
	];
	extraLuaConfig = "
	vim.cmd('set expandtab sw=4 sts=4')
        vim.cmd('set number')
        vim.cmd('set relativenumber')
	";
  };
}
