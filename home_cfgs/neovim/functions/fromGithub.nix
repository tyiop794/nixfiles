{user, repo, rev, ref ? "HEAD", buildScript ? ":"}:

let
  pkgs = import <nixpkgs> {};
in

pkgs.vimUtils.buildVimPlugin {
   pname = "${pkgs.lib.strings.sanitizeDerivationName repo}";
   version = ref;
   src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      inherit ref;
      inherit rev;
   };
   inherit buildScript;
}



