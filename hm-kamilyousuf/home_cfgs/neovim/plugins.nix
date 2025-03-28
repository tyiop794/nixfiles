{pkgs, ...}:
{
    programs.neovim = {
        plugins = with pkgs.vimPlugins; [
           plenary-nvim
           vim-fugitive
	   vimtex
           nvim-web-devicons
           {
                plugin = nvim-tree-lua;
                type = "lua";
                config = ''
                vim.cmd('packadd! nvim-tree.lua')
                require("nvim-tree").setup()
                vim.g.loaded_netrw = 1
                vim.g.loaded_netrwPlugin = 1
                vim.opt.termguicolors = true
                '';
           }
           {
                plugin = trouble-nvim;
                type = "lua";
                config = ''
                require("trouble").setup()
                '';
           }
           {
                plugin = fzf-lua;
                type = "lua";
                config = ''
                require("fzf-lua").setup({"fzf-vim"})
                '';
           }
           {
                plugin = comment-nvim;
                type = "lua";
                config = ''
                    require('Comment').setup()
                '';
           }
        ];
    };
}
