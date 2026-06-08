local M = {}

local function get_current_file()
  local file_path = vim.api.nvim_buf_get_name(0)
  if file_path == "" then
    vim.notify("El buffer actual no tiene un archivo válido", vim.log.levels.WARN)
    return nil
  end

  return vim.fn.fnamemodify(file_path, ":.")
end

function M.copy_current_location()
  local file_path = get_current_file()
  if not file_path then
    return
  end

  local line = vim.fn.line(".")
  local result = string.format("%s:L%d", file_path, line)

  vim.fn.setreg("+", result)
  vim.notify("Copiado: " .. result, vim.log.levels.INFO)
end

function M.copy_visual_location()
  local file_path = get_current_file()
  if not file_path then
    return
  end

  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local result = string.format("%s:L%d-L%d", file_path, start_line, end_line)

  vim.fn.setreg("+", result)
  vim.notify("Rango copiado: " .. result, vim.log.levels.INFO)

  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end

return M
