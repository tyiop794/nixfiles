{configs, inputs, pkgs, lib, ... }:
{
    programs.neovim = {
        plugins = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            nvim-cmp
        ];
        extraPackages = with pkgs; [
            clang-tools
            rust-analyzer
        ];
        extraLuaConfig = "
	require'lspconfig'.clangd.setup{}
	require'lspconfig'.rust_analyzer.setup{}
        ";
    };
}

