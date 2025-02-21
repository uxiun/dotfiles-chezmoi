function chgmod -d "chgrp, chmod g+w"
	set -l group $argv[1]
	set -l args $argv[2..]
	argparse "r=+" -- $args
	if test -n $_flag_r
		sudo chgrp -R $group $args
		if test $status -eq 0
			sudo chmod -R g+w $args
		end
	else
		sudo chgrp $group $args
		if test $status -eq 0
			sudo chmod g+w $args
		else
			echo "failed: sudo chgrp $group $args"
		end
	end

end