source /opt/homebrew/share/antigen/antigen.zsh
antigen init $HOME/.antigenrc

ZSH_CUSTOM="$HOME/.zsh-custom"
for config_file ($ZSH_CUSTOM/*.zsh(N)); do
  source $config_file
done

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Preferred editor for local and remote sessions
EDITOR='vim'
VISUAL='vim'

# Set personal aliases, more are bundled in .zsh-custom/*.zsh
# For a full list of active aliases, run `alias`.

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Use brew
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pnpm
export PNPM_HOME="/Users/dsas/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

