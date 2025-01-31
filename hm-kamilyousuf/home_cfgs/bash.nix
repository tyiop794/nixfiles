{config, inputs, ... }:
{
    programs.bash = {
        enable = true;
        bashrcExtra = ''
            set -o vi
            export PATH=$PATH:/home/kamilyousuf/nixfiles/scripts
            export MOZ_DISABLE_RDD_SANDBOX=1
        '';
    };

}
