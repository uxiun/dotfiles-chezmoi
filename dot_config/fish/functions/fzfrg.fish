function fzfrg
	# fzf --ansi --disabled --query "$INITIAL_QUERY" \
	set -l CWD (pwd)
	set -l preview 'bat --color=always {1} --highlight-line {2} --line-range :500'
	set -l previewall "'$preview
if test $status -ne 0
	$FZF_preview_dir
end'"
	
	# --preview-window 'up,64%,border-bottom,+{2}+3/3,~3' \
	# --color "hl:-1:underline,hl+:-1:underline:reverse" \
	# --bind 'enter:become(echo {1})' \
	fzf --ansi --disabled --query "$argv" \
	--bind "start:reload:$RG_PREFIX {q}" \
	--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
	--bind "alt-enter:unbind(change,alt-enter)+change-prompt(2. fzf> )+enable-search+clear-query" \
	--prompt 'rg> ' \
	--delimiter : \
	--preview 'bat --wrap=auto --color=always {1} --highlight-line {2} --line-range (math max 0, (math {2} - 15)):(math {2} + 300)
if test $status -ne 0
	tree {1} -ahpL 3
end
' \
	--preview-window 'up,64%' \
	# --bind "'$FZF_TOGGLE_BIND_SIMPLE'" \
	--bind 'enter:become(echo "$CWD/{1}" | win32yank.exe -i)'
end

# bind {1}: filename, {2}: line number