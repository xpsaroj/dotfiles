set -x QT_QPA_PLATFORMTHEME qt6ct
set -g fish_color_autosuggestion '#465688'
set -gx EDITOR nvim

# Disable fish greeting message
function fish_greeting; end
fnm env --use-on-cd | source

# ==========================================
# ... 
# ==========================================
echo " ┌"
echo -n " │─── "
whoami
echo -n " │─── "
date
echo " └"


# ==========================================
# Aliases
# ==========================================
# alias cd=z									                        # use z for cd
alias hf="eval (history | fzf)"							                # history
alias wlcp=wl-copy

# eza 
alias ls="eza --icons --group-directories-first"				        # ls with eza
alias ll="eza -l --icons --git --group-directories-first --header -h"	# Long listing
alias la="eza -la --icons --git --group-directories-first --header -h"	# Show all including hidden
alias lt="eza --tree --icons --level=2 --group-directories-first"		# Tree view (2 levels)


if status is-interactive
    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config ~/.config/oh-my-posh/themes/custom-theme.omp.json | source
    zoxide init fish | source 
end

# Created by `pipx` on 2025-11-16 15:02:01
set PATH $PATH /home/saroj/.local/bin
