#!bin/bash

echo "##### link terminal setting files ######"
LINK_FILES=(.bash_profile .ideavimrc .tmux.conf .vimrc .config/fnm .config/fisherman .config/peco .config/gocode .config/vue .config/peco .config/.tmux)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/mac/$file ~/$file; \
done

echo "##### finish to link terminal setting files ######"
