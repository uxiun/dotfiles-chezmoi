set -g GUIX_PROFILE ~/.guix-profile
set -g GUIX_LOCPATH ~/.guix-profile/lib/locale

set -gx PAGER moor
set -gx MOOR "-wrap -colors auto"

set -gx PARU_CONF ~/.config/paru/paru.conf
set -gx UCM_WEB_UI ~/nora/unison/ui
set -gx VOLTA_HOME ~/.volta


fish_add_path -g ~/nora/
fish_add_path -g ~/bin/
fish_add_path -g ~/i/emsdk
fish_add_path -g ~/i/emsdk/upstream/emscripten
fish_add_path -g ~/i/emsdk/node/22.16.0_64bit/bin
fish_add_path -g $VOLTA_HOME/bin
fish_add_path -g ~/i/ucm-linux-x64
fish_add_path -g ~/.elan/bin

	abbr -a tr tree
		abbr -a tru tree -gup
		abbr -a trua tree -agup

		abbr -a ais apt search
		abbr -a ail apt list
abbr -a s sudo
	abbr -a sa sudo apt
		abbr -a sar sudo apt remove
		abbr -a saa sudo apt autoremove
		abbr -a sag sudo apt-get
		abbr -a sau sudo apt upgrade
		abbr -a sai sudo apt install
		abbr -a sad sudo apt update
	# abbr -a sg
		abbr -a sgi sudo apt-get install
		abbr -a sgd sudo apt-get update
	abbr -a si sudo nala install
	abbr -a so source
		abbr -a sof . ~/.config/fish/config.fish
	abbr -a sn sudo nala
		abbr -a snr sudo nala remove
		abbr -a sna sudo nala autoremove
		abbr -a snu sudo nala upgrade
		abbr -a snd sudo nala update

	abbr -a do dotnet
		abbr -a dor dotnet run
		abbr -a dop dotnet paket
			abbr -a dopr dotnet paket remove
			abbr -a dopa dotnet paket add
		abbr -a don dotnet new

		abbr -a fdf fd -t f
	abbr -a fj "fzf --preview 'bat --wrap=auto --style=numbers --color=always --line-range :500 {}
if test 1 -eq 0
else
	tree {1} -ahpL 3
end
' --preview-window 'up,64%' --bind 'ctrl-d:change-prompt(dir> )+reload(fd -t d),ctrl-f:change-prompt(file> )+reload(fd -t f),ctrl-x:change-prompt(file(executable)> )+reload(fd -t x)+preview(echo {})'"

abbr -a g git
	abbr -a gw git branch
	abbr -a gz git log
	abbr -a gs git status

		abbr -a gdu git fetch
		abbr -a gdi git push
		abbr -a gdh git restore
		abbr -a gdj git pull
		abbr -a gdja git pull --all
		abbr -a gdk --set-cursor "git commit -m '%'"
		abbr -a gd, git stash -u
		abbr -a gdm git reset
		abbr -a gdn git add .
		abbr -a gdv git stash apply

		abbr -a gdo git rebase
		abbr -a gdl git merge
		abbr -a gdp git cherry-pick
	abbr -a gu guix

		abbr -a gir git remote
		abbr -a gia git add
			abbr -a giam --set-cursor "git add . && git commit -m '%'"
		abbr -a gis git stash
		abbr -a gid git diff
		abbr -a gii git init
		abbr -a gim git commit
			abbr -a gicl git clone
			abbr -a gico git config
	abbr -a gj git switch
		abbr -a gji git switch main
		abbr -a gjk git switch -
		abbr -a gjl git switch -c
	abbr -a ga git branch -vva
	abbr -a gm --set-cursor "git add . && git commit -m '%'"
# z command exists
	abbr -a zj zellij
	abbr -a za zellij a
	abbr -a zf zellij -s
	abbr -a re rbenv
		abbr -a ree rbenv exec
		abbr -a reu rbenv exec bundle
			abbr -a reui rbenv exec bundle install
			abbr -a relogin exec /bin/fish -l
			abbr -a -- relogin 'exec /bin/fish -l'
	abbr -a ru ruby
	abbr -a ca cargo
		abbr -a car cargo remove
		abbr -a caa cargo add
		abbr -a cac cargo clean
		abbr -a cau cargo run
		abbr -a can cargo new
		abbr -a caf cargo +nightly fmt
		abbr -a coa --set-cursor "echo 'abbr -a %' >> ~/.config/fish/config.fish"
			abbr -a confi --set-cursor "echo \"%\" >> ~/.config/fish/config.fish"
	abbr -a ch chezmoi
		abbr -a che chezmoi edit
		abbr -a chef chezmoi edit ~/.config/fish/config.fish
		abbr -a chd "chezmoi diff"
		abbr -a chn chezmoi forget
		abbr -a chc chezmoi cd
		abbr -a chi chezmoi add
		abbr -a chk chezmoi apply
		abbr -a chl chezmoi merge
		abbr -a chla chezmoi merge-all
	abbr -a .f --position anywhere "~/.config/fish/config.fish"
	abbr -a .l --position anywhere "|"
	abbr -a .m --position anywhere "| $PAGER"
	abbr -a .i --position anywhere install
	abbr -a .a --position anywhere "| xargs -I{}"
abbr -a b bat
	abbr -a ui uv pip install
	abbr -a up uv pip
		abbr -a uve uv venv
abbr -a p sudo pacman
	abbr -a pa pacman
		abbr -a pas sudo pacman -S
		abbr -a pasyu sudo pacman -Syu
abbr -a j cd
	abbr -a jk cd ..

	abbr -a le $PAGER
	abbr -a lg --set-cursor "ls | grep -E '/%/'"
	abbr -a ll ls -l
	abbr -a la ls -la
abbr -a m mkentries
	abbr -a mg /mnt/c/Users/itmik/0z/MassiGra045/MassiGra.exe

	abbr -a nl nala
		abbr -a nld nala list
		abbr -a nls nala search
	abbr -a npr npm run
	abbr -a np npm
	abbr -a nm pnpm
		abbr -a nme pnpm exec
		abbr -a nmd pnpm dev
		abbr -a nmf pnpm exec biome format --write
		abbr -a nmc pnpm exec biome check --write
		abbr -a nmi pnpm i -D
		abbr -a nml pnpm lint
abbr -a , --set-cursor --position anywhere '~/%'
	abbr -a ,e --position anywhere -- --help
	abbr -a ,s --set-cursor --position anywhere -- '~/school/class/%'
		abbr -a ,sd --set-cursor --position anywhere -- '~/school/class/3f/%'
	abbr -a ,d --set-cursor --position anywhere -- '/mnt/c/Users/itmik/OneDrive/%'
		abbr -a ,df --set-cursor --position anywhere -- '/mnt/c/Users/itmik/OneDrive\ -\ 筑波大学/%'
		abbr -a ,ds --set-cursor --position anywhere -- '/mnt/c/Users/itmik/OneDrive\ -\ 筑波大学/study/%'
	abbr -a ,c --set-cursor --position anywhere -- /mnt/c/Users/itmik/%
		abbr -a ,cd --set-cursor --position anywhere -- /mnt/c/Users/itmik/Downloads/%

	abbr -a vt volta

# pnpm
set -gx PNPM_HOME "~/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by `rbenv init` on Sun Feb  2 07:15:56 PM JST 2025
# status --is-interactive; and rbenv init - --no-rehash fish | source

zoxide init fish | source
