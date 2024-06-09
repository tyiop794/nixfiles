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
    ./plugins.nix
  ];
  programs.neovim = {
  	enable = true;
  	defaultEditor = true;
	extraLuaConfig = "
	vim.cmd('set expandtab sw=4 sts=4')
        vim.cmd('set number')
        vim.cmd('set relativenumber')
	";
  };
}
