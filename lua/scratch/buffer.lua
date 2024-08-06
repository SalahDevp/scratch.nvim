local Buffer = {}

local Config = require("scratch.config")

function Buffer.open(type)
	if not Buffer.buf then
		Buffer.buf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_buf_set_name(Buffer.buf, "*scratch*")
		vim.api.nvim_set_option_value("filetype", type, { buf = Buffer.buf })

	-- clear buffer when type changes
	elseif type ~= vim.api.nvim_get_option_value("filetype", { buf = Buffer.buf }) then
		vim.api.nvim_buf_set_lines(Buffer.buf, 0, -1, false, {})
		vim.api.nvim_set_option_value("filetype", type, { buf = Buffer.buf })
	end

	vim.api.nvim_win_set_buf(0, Buffer.buf)
	vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(Buffer.buf), 0 })
end

function Buffer.detectType()
	local currentBuf = vim.api.nvim_get_current_buf()
	return vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
end

function Buffer.eval()
	local currentBuf = vim.api.nvim_get_current_buf()
	if currentBuf ~= Buffer.buf then
		print("open a scratch buffer to run")
		return
	end

	local bufType = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
	local langConfig = Config.languages[bufType]

	if not langConfig or not langConfig.run_cmd then
		print("run command isn't configured for filetype: " .. bufType)
		return
	end

	vim.cmd("w ! " .. langConfig.run_cmd)
end

return Buffer

-- gcc -x c - -o /dev/stdout | sh
