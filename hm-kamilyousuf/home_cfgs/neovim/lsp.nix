{configs, inputs, pkgs, lib, ... }:
{
    programs.neovim = {
        plugins = with pkgs.vimPlugins; [
            {
                plugin = nvim-lspconfig;
                type = "lua";
                config = ''
                    require'lspconfig'.clangd.setup{}
                    require'lspconfig'.rust_analyzer.setup{}
                '';
            }
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            nvim-cmp
        ];
        extraPackages = with pkgs; [
            clang-tools
            rust-analyzer
        ];
        /*
        extraLuaConfig = "
	require'lspconfig'.clangd.setup{}
	require'lspconfig'.rust_analyzer.setup{}
        ";
        */
    };
}

