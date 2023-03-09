local project = require("project_nvim")

project.setup({
  manual_mode = true,
  silent_chdir = true,
})

local telescope = require("telescope")
telescope.load_extension("projects")
