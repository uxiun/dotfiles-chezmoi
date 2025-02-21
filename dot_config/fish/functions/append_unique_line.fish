function append_unique_line 
	set -l line $argv[1]
	set -l dest $argv[2]
	set -l rgres (rg "$line" $dest)
	if test $status -ne 0 # when fail = not found
		echo "$line" >> $dest
	end
end