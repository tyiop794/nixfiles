{pkgs, ... }:
{
  programs.neovim = {
	plugins = with pkgs.vimPlugins; [
           {
	        plugin = gruvbox-nvim;
                type = "lua";
                config = ''
                  vim.o.background = \"dark\"
                  vim.o.termguicolors = true
                  vim.cmd('colorscheme gruvbox')
                ''
           }
	];
  };
}
