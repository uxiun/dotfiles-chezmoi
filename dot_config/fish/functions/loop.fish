function loop -d "immediately reexecute command when failed"
	$argv 
	if test $status -ne 0
		$argv
	end
end