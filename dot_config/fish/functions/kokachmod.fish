function kokachmod -d "koka compile then chmod+x" -w chmod
	set -l f $argv[1]
	if test -e $f 
		set -l name (string replace -r "\.kk\$" "" "$f")
		koka -O2 -o $name.out $f 1>&2
		if test -e $name.out
			chmod +x $name.out
		end
	end
end