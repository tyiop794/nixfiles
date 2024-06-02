{pkgs, ... }:
{
  programs.neovim = {
	plugins = with pkgs.vimPlugins; [
	   gruvbox-nvim
	];
	extraLuaConfig = 
	"
          vim.o.background = \"dark\"
	  vim.o.termguicolors = true
	  vim.cmd('colorscheme gruvbox')
	";
  };
}
