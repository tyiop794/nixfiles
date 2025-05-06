{config, inputs, ... }:
{
    programs.zsh = {
        enable = true;
        zshrcExtra = ''
            set -o vi
            export PATH=$PATH:/home/kamilyousuf/nixfiles/scripts
            export MOZ_DISABLE_RDD_SANDBOX=1
        '';
    };

}
