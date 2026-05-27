local M = {}

local pi_term

local function get_relative_path(file_path)
	return vim.fn.fnamemodify(file_path, ":.")
end

local function get_current_file()
	local file_path = vim.api.nvim_buf_get_name(0)
	if file_path == "" then
		vim.notify("Current buffer has no file path", vim.log.levels.WARN)
		return nil
	end

	return get_relative_path(file_path)
end

local function get_visual_range()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")

	if start_line == 0 or end_line == 0 then
		start_line = vim.fn.getpos("'<")[2]
		end_line = vim.fn.getpos("'>")[2]
	end

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	return start_line, end_line
end

local function send_text(term, text)
	if not term or not term.job_id then
		return
	end

	vim.fn.chansend(term.job_id, text)
	term:focus()
	vim.cmd("startinsert!")
end

local function get_pi_term()
	if pi_term then
		return pi_term
	end

	local ok, terminal = pcall(require, "toggleterm.terminal")
	if not ok then
		vim.notify("toggleterm.nvim is not available", vim.log.levels.ERROR)
		return nil
	end

	local Terminal = terminal.Terminal
	local width_ratio = 0.9
	local height_ratio = 0.9

	pi_term = Terminal:new({
		cmd = "pi",
		hidden = true,
		direction = "float",
		float_opts = {
			width = math.floor(vim.o.columns * width_ratio),
			height = math.floor(vim.o.lines * height_ratio),
			row = math.floor((vim.o.lines - (vim.o.lines * height_ratio)) / 2),
			col = math.floor((vim.o.columns - (vim.o.columns * width_ratio)) / 2),
			border = "rounded",
		},
		on_open = function()
			vim.cmd("startinsert!")
		end,
	})

	return pi_term
end

function M.toggle()
	if vim.fn.executable("pi") ~= 1 then
		vim.notify("`pi` is not installed or not available in PATH", vim.log.levels.WARN)
		return
	end

	local term = get_pi_term()
	if not term then
		return
	end

	term:toggle()
end

function M.open()
	if vim.fn.executable("pi") ~= 1 then
		vim.notify("`pi` is not installed or not available in PATH", vim.log.levels.WARN)
		return nil
	end

	local term = get_pi_term()
	if not term then
		return nil
	end

	if not term:is_open() then
		term:open()
	else
		term:focus()
	end

	return term
end

function M.add_current_location()
	local file_path = get_current_file()
	if not file_path then
		return
	end

	local prompt = string.format("@%s ", file_path)
	local term = M.open()

	if not term then
		return
	end

	vim.defer_fn(function()
		send_text(term, prompt)
	end, 50)
end

function M.add_visual_location()
	local file_path = get_current_file()
	if not file_path then
		return
	end

	local start_line, end_line = get_visual_range()
	local prompt = string.format("@%s:L%d-L%d", file_path, start_line, end_line)
	local term = M.open()

	if not term then
		return
	end

	vim.defer_fn(function()
		send_text(term, prompt)
	end, 50)
end

return M
