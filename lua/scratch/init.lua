local M = {}

local Buffer = require("scratch.buffer")
local Config = require("scratch.config")

function M.setup(opts)
	if opts then
		Config.init(opts)
	end

	vim.api.nvim_create_user_command("Scratch", function(args)
		local arg1 = args.fargs[1]
		local bufType = args.fargs[2] or Buffer.detectType()

		if arg1 == "buf" then
			Buffer.open(bufType)
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
