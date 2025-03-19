# show trailing whitespaces in git diff
git config --global diff.wsErrorHighlight all

# use nvim for diff and merge tools
git config --global diff.tool nvim
git config --global difftool.nvim.cmd 'nvim -d "$LOCAL" "$REMOTE"'
git config --global merge.tool nvim
git config --global mergetool.nvim.cmd 'nvim -d "$LOCAL" "$REMOTE" "$MERGED"'
