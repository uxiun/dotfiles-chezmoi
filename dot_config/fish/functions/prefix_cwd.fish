function prefix_cwd
	set -l cwd (pwd)
	set -l r
	for a in $argv
		set -a r "$cwd/$a"
	end
	echo $r
end