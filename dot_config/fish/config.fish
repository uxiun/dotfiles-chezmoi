# set -g LIBGL_ALWAYS_INDIRECT 0
set -g GUIX_PROFILE ~/.guix-profile
set -g GUIX_LOCPATH ~/.guix-profile/lib/locale
# set -g DISPLAY \$(cat /etc/resolv.conf | grep nameserver | awk '{print \$2}'):0.0
# set -g DISPLAY `hostname`.mshome.net:0.0

set -g PAGER moar
set -g MOAR -wrap
set -g PARU_CONF ~/.config/paru/paru.conf
set -g UCM_WEB_UI ~/nora/unison/ui

fish_add_path -g ~/nora/

	abbr -a tr tree
		abbr -a tru tree -gup
		abbr -a trua tree -agup

		abbr -a aba abbr -a
	abbr -a so source
		abbr -a sof . ~/.config/fish/config.fish
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
		abbr -a chd chezmoi -v diff
		abbr -a chc chezmoi cd
		abbr -a chi chezmoi add
		abbr -a chk chezmoi -v apply
		abbr -a chl chezmoi -v merge
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
	abbr -a le $PAGER
	abbr -a lg --set-cursor "ls | grep -E '/%/'"
	abbr -a ll ls -l
	abbr -a la ls -la
abbr -a m mkentries
	abbr -a mg /mnt/c/Users/itmik/0z/MassiGra045/MassiGra.exe
	abbr -a npr npm run
	abbr -a np npm
	abbr -a nm pnpm
			abbr -a nmid pnpm i -D
		abbr -a nmd pnpm dev
		abbr -a nml pnpm lint
abbr -a , --set-cursor --position anywhere '~/%'
	abbr -a ,e --position anywhere -- --help
	abbr -a ,s --set-cursor --position anywhere -- '~/school/class/%'
		abbr -a ,sd --set-cursor --position anywhere -- '~/school/class/3f/%'
	abbr -a ,c --set-cursor --position anywhere -- /mnt/c/Users/itmik/%
		abbr -a ,cs --set-cursor --position anywhere -- '/mnt/c/Users/itmik/OneDrive\ -\ 筑波大学/%'
		abbr -a ,cc --set-cursor --position anywhere -- '/mnt/c/Users/itmik/OneDrive\ -\ 筑波大学/study/class/3f/%'
		abbr -a ,cd --set-cursor --position anywhere -- /mnt/c/Users/itmik/Downloads/%

# pnpm
set -gx PNPM_HOME "~/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by `rbenv init` on Sun Feb  2 07:15:56 PM JST 2025
# status --is-interactive; and rbenv init - --no-rehash fish | source

# source ~/.venv/bin/activate.fish
