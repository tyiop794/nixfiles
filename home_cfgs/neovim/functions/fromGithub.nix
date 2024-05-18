{pkgs, user, repo, rev, ref ? "HEAD", buildScript ? ":"}:

pkgs.vimUtils.buildVimPlugin {
   pname = "${pkgs.lib.strings.sanitizeDerivationName repo}";
   version = ref;
   src = builtins.fetchGit {
      url = "https://github.com/${user}/${repo}.git";
      inherit ref;
      inherit rev;
   };
   inherit buildScript;
}



