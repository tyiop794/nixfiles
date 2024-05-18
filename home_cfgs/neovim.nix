{config, inputs, pkgs, lib, ... }:
  let
    fromGithub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
	ref = ref;
	rev = rev;
      };
    };
  in 
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
	   (fromGithub "ac7ad3c8e61630d15af1f6266441984f54f54fd2" "HEAD" "elihunter173/dirbuf.nvim")
	];
	extraLuaConfig = 
	"
	  vim.o.termguicolors = true
	  vim.cmd('colorscheme gruvbox')
	"
  };
}
