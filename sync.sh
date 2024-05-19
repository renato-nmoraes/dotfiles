path_to_this_script="${BASH_SOURCE[0]}"
script_parent=$(cd $(dirname "${path_to_this_script}") && pwd)

if [[ "$1" == "restore" ]]; then
	rsync -avuP ${script_parent}/.bashrc /home/renato/.bashrc
	mkdir -p /home/renato/.config/nvim
	rsync -avuP ${script_parent}/init.vim /home/renato/.config/nvim/init.vim
	rsync -avuP ${script_parent}/.bash_profiles /home/renato/bash_profiles
	rsync -avuP ${script_parent}/.bash_aliases /home/renato/.bash_aliases
	exit 0
fi
rsync -avuP /home/renato/.bashrc ${script_parent}/.bashrc
rsync -avuP /home/renato/.bash_profiles ${script_parent}/.bash_profiles
rsync -avuP /home/renato/.bash_aliases ${script_parent}/.bash_aliases
rsync -avuP /home/renato/.vimrc ${script_parent}/.vimrc
rsync -avuP /home/renato/.config/nvim/init.vim ${script_parent}/init.vim
code --list-extensions > ${script_parent}/.vscode-extensions
rsync -avuP /home/renato/.vscode/renato.code-profile ${script_parent}/renato.code-profile
#if [[ -f ${script_parent}/transfuse.sh ]]; then
#	${script_parent}/transfuse.sh -b $(whoami)
#else
#	curl https://gitlab.com/cscs/transfuse/-/raw/master/transfuse.sh --output ${script_parent}/transfuse.sh
#	chmod +x ${script_parent}/transfuse.sh
#	${script_parent}/transfuse.sh -b $(whoami)
#fi
rsync -avuP --filter="merge .rsync-filter" /home/renato/.config/* ${script_parent}/.config
