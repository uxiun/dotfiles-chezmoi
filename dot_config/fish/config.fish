set -g DISPLAY 0
set -g LIBGL_ALWAYS_INDIRECT 0
set -g GUIX_PROFILE /home/u/.guix-profile
set -g GUIX_LOCPATH /home/u/.guix-profile/lib/locale
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
	abbr -a ga git branch -vva
	abbr -a gm --set-cursor "git add . && git commit -m '%'"
# z command exists
	abbr -a zj zellij
	abbr -a za zellij a
	abbr -a zf zellij -s
			abbr -a relogin exec /bin/fish -l
			abbr -a -- relogin 'exec /bin/fish -l'
	abbr -a ca cargo
		abbr -a car cargo remove
		abbr -a caa cargo add
		abbr -a cac cargo clean
		abbr -a cau cargo run
		abbr -a can cargo new
		abbr -a caf cargo +nightly fmt
		abbr -a coa --set-cursor "echo 'abbr -a %' >> ~/.config/fish/config.fish"
			abbr -a confi --set-cursor "echo \"%\" >> ~/.config/fish/config.fish"
			abbr -a --set-cursor='%' -- confi 'echo "%" >> ~/.config/fish/config.fish'
	abbr -a ch chezmoi
		abbr -a chd chezmoi -v diff
		abbr -a chc chezmoi cd
		abbr -a chi chezmoi add
		abbr -a chk chezmoi -v apply
		abbr -a chl chezmoi -v merge
	abbr -a .l --position anywhere "| moar"
	abbr -a .i --position anywhere install
	abbr -a .a --position anywhere "| xargs -I{}"
abbr -a b bat
abbr -a p sudo pacman
	abbr -a pa pacman
		abbr -a pas sudo pacman -S
abbr -a j cd
	abbr -a le moar
	abbr -a ll ls -l
	abbr -a la ls -la
abbr -a m mkentries
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
set -gx PNPM_HOME "/home/u/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
