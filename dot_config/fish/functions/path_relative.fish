function path_relative
	set -l viewpoint $argv[1]
	set -l sight $argv[2]
	set -l vs (string split / $viewpoint)
	set -l ss (string split / $sight)
	set -l continue 1
	for i in (seq 1 (math max (count $vs), (count $ss)))
		if test -n $vs[$i]
		if test -n $ss[$i]
			if $vs[$i] != $ss[$i]
				set -g until $i
				break
			end
		else
			set -g until $i
			break
		end
		else
			set -g until $i
			break
		end
	end

	set -l up (string repeat -n (math (count $vs[$until..]) - 1)) "../"
	set -l stail (string join / $vtail[$until..])
	echo (string join "" $up $stail)
end