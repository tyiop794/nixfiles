{user, repo, ref ? "HEAD", buildScript ? ":"}:

let
  pkgs = import <nixpkgs> {};
in

pkgs.vimUtils.buildVimPlugin {
   pname = "${lib.strings.sanitizeDerivationName repo}";
   version = ref;
   src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
      rev = rev;
   };
   inherit buildScript;
}



