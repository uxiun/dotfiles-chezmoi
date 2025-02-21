function mkentryleaves -d "same folder, many files" -w ls 
	set -l created
	set -l parent
	for a in $argv
		if test -e $a 
		else 
			set -l res (string match "*/" $a)
			# if test $status -eq 0
			if test -z $res
				set -l output $a 
				if test -z (string match "*/" $parent)
				else 
					set output $parent$a
				end
				install -D /dev/null $output
				set -a created $output
			else
				mkdir -p $a
				set parent $a
				set -a created $a
			end
		end 
	end
	for e in $created 
		echo $e 
	end
end