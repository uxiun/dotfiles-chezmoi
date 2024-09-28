set -g GUIX_LOCPATH /home/u/.guix-profile/lib/locale

		abbr -a aba abbr -a
	abbr -a do dotnet
		abbr -a dor dotnet run
		abbr -a dop dotnet paket
			abbr -a dopr dotnet paket remove
			abbr -a dopa dotnet paket add
		abbr -a don dotnet new
abbr -a g git
	abbr -a gw git log
	abbr -a gs git status

		abbr -a gdu git fetch
		abbr -a gdi git push
		abbr -a gdh git restore
		abbr -a gdj git pull
		abbr -a gdk --set-cursor git commit -m '%'
		abbr -a gd, git stash -u
		abbr -a gdm git reset
		abbr -a gdn git add .
		abbr -a gdv git stash apply

		abbr -a gdo git rebase
		abbr -a gdl git merge
		abbr -a gdp git cherry-pick

		abbr -a gia git add
			abbr -a giam --set-cursor "git add . && git commit -m '%'"
		abbr -a gis git stash
		abbr -a gii git init
		abbr -a gim git commit
			abbr -a gicl git clone
			abbr -a gico git config
	abbr -a gk git switch
		abbr -a gke git switch -
	abbr -a ga git branch -vva
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
abbr -a b bat
abbr -a j cd
	abbr -a le moar
	abbr -a ll ls -l
	abbr -a la ls -la
abbr -a m mkentries
abbr -a , --set-cursor --position anywhere '~/%'
		abbr -a pas sudo pacman -S
	abbr -a ,e --position anywhere -- --help
	abbr -a gu guix
