function atcoder -d "cargo compete new contest setup" -a contest
	set -l lastwd (pwd)
	cd ~/o/rust/atcoder
	cargo compete new $contest
	if test $status -eq 0
		cd $contest

		mkentries .vscode/settings.json
		set -l cwd (pwd)
		cat << 'EOF' > .vscode/settings.json 
{
	"rust-analyzer.linkedProjects": [
		"$cwd/Cargo.toml"
	],
}
EOF
# " >> .vscode/settings.json
		echo "
[profile.dev]
opt-level = 3

[workspace]
members = []
" >> Cargo.toml
	end
	cd $lastwd
end