{config, inputs, ... }:
{
    programs.zsh = {
        enable = true;
        initContent = ''
            set -o vi
            export PATH=$PATH:/home/kamilyousuf/nixfiles/scripts
            export MOZ_DISABLE_RDD_SANDBOX=1
        '';
        oh-my-zsh.enable = true;
    };

}
