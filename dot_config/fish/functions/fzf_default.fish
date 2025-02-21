function fzf_default -d "default fzf command, toggle keybind, column layout"
	fzf \
	--bind "'$FZF_TOGGLE_BIND_SIMPLE'" \
	--preview "'$FZF_preview'" \
	--preview-window "'$FZF_preview_window'" 
end