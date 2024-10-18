local Utils = {}

function Utils.get_selected_visual_mode(mode)
	local pos1 = vim.fn.getpos(".")
	local pos2 = vim.fn.getpos("v")
	return vim.fn.getregion(pos1, pos2, { type = mode })
end

return Utils
