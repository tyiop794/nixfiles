{config, inputs, pkgs, ... }:
{
  # My neovim configuration
  # (will be more complex later)
  programs.neovim = {
  	enable = true;
  	defaultEditor = true;
	plugins = with pkgs.vimPlugins; [
	   nvim-lspconfig
	   nvim-treesitter.withAllGrammars
	   plenary-nvim
	   gruvbox
	];
  };
}
