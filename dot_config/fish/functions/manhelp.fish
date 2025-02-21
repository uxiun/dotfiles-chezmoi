function manhelp -d "man or --help | $PAGER"
	# help $argv
	# if test $status -ne 0
		man $argv
		if test $status -ne 0
			$argv --help | $PAGER 
		end
	# end
end