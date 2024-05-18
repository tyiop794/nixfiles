{pkgs, ... }:
{
  programs.neovim = {
	plugins = with pkgs.vimPlugins; [
	   gruvbox
	];
	extraLuaConfig = 
	"
	  vim.o.termguicolors = true
	  vim.cmd('colorscheme gruvbox')
	";
  };
}
