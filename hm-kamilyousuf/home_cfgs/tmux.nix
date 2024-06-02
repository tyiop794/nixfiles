{config, inputs, ... }:
{
  programs.tmux = {
  	enable = true;
        terminal = "screen-256color";
        mouse = true;
        keyMode = "vi";
        extraConfig = "
        # Start windows and panes at 1, not 0
        set -g base-index 1
        setw -g pane-base-index 1

        # Renumber windows
        set-option -g renumber-windows on

        # Statusline Colors
        set -g status-style bg=terminal,fg=terminal

        # Statusline location
        set -g status-position bottom

        # Current window name bold
        set -g window-status-current-style fg=terminal,bold

        # Time settings
        set -g status-right \"%I:%M %p, %d-%b-%y, %a\"

        # Set VI keybindings for navigating windows in tmux
        set-window-option -g mode-keys vi
        ";
  };
}
