local M = {}

local Buffer = require("scratch.buffer")
local Config = require("scratch.config")
local Utils = require("scratch.utils")

function M.setup(opts)
	if opts then
		Config.init(opts)
	end

	vim.api.nvim_create_user_command("Scratch", function(args)
		local arg1 = args.fargs[1]
		local bufType = args.fargs[2] or Buffer.detectType()

		if arg1 == "buf" then
			local selected_text = nil

			local mode = vim.fn.mode()
			if mode == "v" or mode == "V" or mode == "\x16" then
				selected_text = Utils.get_selected_visual_mode(mode)
			end

			Buffer.open(bufType)
			if selected_text then
				Buffer.set_content(selected_text)
			end
		elseif arg1 == "eval" then
			Buffer.eval()
		end
	end, {
		nargs = "+",
		complete = function(arglead, cmdline, cursorpos)
			return { "buf", "eval" }
		end,
	})
end

return M
