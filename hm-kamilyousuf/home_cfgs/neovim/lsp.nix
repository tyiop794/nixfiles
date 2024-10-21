{configs, inputs, pkgs, lib, ... }:
{
    programs.neovim = {
        plugins = with pkgs.vimPlugins; [
            {
                plugin = nvim-lspconfig;
                type = "lua";
                config = ''
                    local capabilities = require('cmp_nvim_lsp').default_capabilities()
                    require'lspconfig'.clangd.setup{
                        capabilities = capabilities
                    }
                    require'lspconfig'.rust_analyzer.setup{
                        capabilities = capabilities
                    }
                    require'lspconfig'.pyright.setup{
                        capabilities = capabilities
                    }
                '';
            }
            {
                plugin = nvim-treesitter.withAllGrammars;
                type = "lua";
                config = ''
                require'nvim-treesitter.configs'.setup {
                      highlight = {
                        enable = true,              -- false will disable the whole extension
                      }
                }
                '';
            }
            playground
            {
                plugin = nvim-cmp;
                type = "lua";
                config = (builtins.readFile ./lsp.lua);
            }
            vim-vsnip
            cmp-vsnip
            cmp-nvim-lsp
            cmp-buffer
            cmp-path
            cmp-cmdline
        ];
        extraPackages = with pkgs; [
            clang-tools
            rust-analyzer
            pyright
        ];
        /*
        extraLuaConfig = "
	require'lspconfig'.clangd.setup{}
	require'lspconfig'.rust_analyzer.setup{}
        ";
        */
    };
}

