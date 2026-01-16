# Sync my wp.com sandbox
alias wpcom-sync='unison -ui text -repeat watch wpcom'
alias wpcom-sync-once='unison -ui text wpcom'
alias mc-sync='unison -ui text -repeat watch missioncontrol'

alias pnpm='npx pnpm'

# Sync local gb to wpcom sandbox
alias gbsync="rsync -rvahz . wpcom-sandbox:/home/wpcom/public_html/wp-content/plugins/gutenberg-core/dev/ --include-from=$HOME/bin/gb-sync/include --exclude-from=$HOME/bin/gb-sync/exclude"
