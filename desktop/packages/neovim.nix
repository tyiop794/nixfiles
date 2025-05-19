{ config, lib, pkgs, inputs, ...}:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    environment.systemPackages = with pkgs; [
        clang-tools
        rust-analyzer
        pyright
        millet
        vimPlugins.nvim-treesitter.withAllGrammars
        gcc
    ];
}
