function fish_prompt
	set -l last_status $status

	set -l normal (set_color normal)
	set -l usercolor (set_color $fish_color_user)

	set -l delim $_hydro_status # \U25BA
	# If we don't have unicode use a simpler delimiter
	string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL; or set delim ">"

	# fish_is_root_user; and set delim "#"

	set -l cwd (set_color $fish_color_cwd)
	if command -sq cksum
		# randomized cwd color
		# We hash the physical PWD and turn that into a color. That means directories (usually) get different colors,
		# but every directory always gets the same color. It's deterministic.
		# We use cksum because 1. it's fast, 2. it's in POSIX, so it should be available everywhere.
		set -l shas (pwd -P | cksum | string split -f1 ' ' | math --base=hex | string sub -s 3 | string pad -c 0 -w 6 | string match -ra ..)
		set -l col 0x$shas[1..3]

		# If the (simplified idea of) luminance is below 120 (out of 255), add some more.
		# (this runs at most twice because we add 60)
		# while test (math 0.2126 x $col[1] + 0.7152 x $col[2] + 0.0722 x $col[3]) -lt 120
		#     set col[1] (math --base=hex "min(255, $col[1] + 60)")
		#     set col[2] (math --base=hex "min(255, $col[2] + 60)")
		#     set col[3] (math --base=hex "min(255, $col[3] + 60)")
		# end

		# 逆に明るすぎたら調整
		set -l commas (string join , $col)
		set -l maxc (math "max $commas")
		set -l minc (math "min $commas")

		# 彩度強め
		set -l maxi 0
		set -l mini 0
		set -l midi 0
		set -l i 1
		while test $i -le 3
			if test $maxc -eq $col[$i]
				set maxi $i
			else 
				if test $minc -eq $col[$i]
					set mini $i 
				end
			end 
			set i (math $i + 1)
		end
		set -l i 1
		while test $i -le 3
			if test $maxi -ne $i
				if test $mini -ne $i
					set midi $i
				end 
			end 
			set i (math $i + 1)
		end
		# if test $maxi -gt 0 
		# 	set -l saturation (math "($maxc - $minc) / $maxc x 100")
		# 	while test $saturation -lt 60
		# 		if test $col[$maxi] -le 250
		# 			set col[$maxi] (math "$col[$maxi] + 5")
		# 		else
		# 			break
		# 		end
		# 		if test $mini -gt 0
		# 			if test $col[$mini] -ge 5
		# 				set col[$mini] (math "$col[$mini] - 5")
		# 			else 
		# 				break
		# 			end
		# 		end
		# 		set commas (string join , $col)
		# 		set maxc (math "max $commas")
		# 		set minc (math "min $commas")
		# 		set saturation (math "($maxc - $minc) / $maxc x 100")
		# 	end
		# end
		
		# 明度低め
		# set -l j 1
		# while test $j -le 5
			while test (math (math 21.26 x 255 + 71.52 x 255 + 7.22 x 255 + 5) / (math 21.26 x $col[1] + 71.52 x $col[2] + 7.22 x $col[3] + 5)) -lt 4.5
				set -l i 1
				
				if test $maxi -gt 0
					set -l saturation (math "($col[$maxi] - $col[$mini]) / $col[$maxi] x 100")
					if test $saturation -lt 50
						set col[$maxi] (math "$col[$maxi] + 5")
					end
				end 

				if test $midi -gt 0
					if test $col[$mini] -gt 0
						set col[$midi] (math "$col[$midi] x 0.7 - 5")
					else 
						set col[$maxi] (math $col[$maxi] - 5)
					end
				end
				
				if test $mini -gt 0
					if test $col[$mini] -gt 0
						set col[$mini] (math "$col[$mini] x 0.7 - 5")
					else 
						# set col[$maxi] (math $col[$maxi] - 5)
						
					end
				end
			end 
			# set j (math $j + 1)
		# end

		# set col[1] (math --base=hex "$col[1]")
		# set col[2] (math --base=hex "$col[2]")
		# set col[3] (math --base=hex "$col[3]")
		set col[1] (math --base=hex "min(255, max(0, $col[1]))")
		set col[2] (math --base=hex "min(255, max(0, $col[2]))")
		set col[3] (math --base=hex "min(255, max(0, $col[3]))")
		set -l col (string replace 0x '' $col | string pad -c 0 -w 2 | string join "")

		set cwd (set_color $col)
	end

	# Prompt status only if it's not 0
	# set -l prompt_status
	# test $last_status -ne 0; and set prompt_status (set_color $fish_color_status)"[$last_status]$normal"

	# Only show host if in SSH or container
	# Store this in a global variable because it's slow and unchanging
	if not set -q prompt_host
		if set -q SSH_TTY
			or begin
				command -sq systemd-detect-virt
				and systemd-detect-virt -q
			end
			set prompt_host $usercolor$USER$normal@(set_color $fish_color_host)$hostname$normal":"
			set -l prompt_host_changed true
		end
	end
	# if not set -q prompt_host_changed
	set -l prompt_host $usercolor$USER$normal
	# end

	# Shorten pwd if prompt is too long
	# set -l pwd (prompt_pwd)
	set -l pwd (prompt_pwd --full-length-dirs=2 --dir-length=2)
	# set -l dt (set_color brgrey)(date "+%R")(set_color normal)

	echo -n -s $prompt_host $cwd $pwd $normal $prompt_status $cwd $delim " "
end
