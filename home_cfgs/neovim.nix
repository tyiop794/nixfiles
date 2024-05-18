{config, inputs, pkgs, lib, ... }:
/*
  let
    fromGithub = ref: repo: pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
	ref = ref;
      };
    };
  in 
  */
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
	   # (fromGithub "HEAD" "elihunter173/dirbuf.nvim")
	];
  };
}
