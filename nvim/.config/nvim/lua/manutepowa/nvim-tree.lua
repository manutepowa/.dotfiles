local present, nvimtree = pcall(require, "nvim-tree")
if not present then
  return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback
local key_bindings = {
  { key = "<CR>", cb = tree_cb("preview") },
  { key = { "<Tab>", "o" }, cb = tree_cb("edit") },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
  { key = "q", cb = tree_cb("close") },
  { key = "<", cb = tree_cb("prev_sibling") },
  { key = ">", cb = tree_cb("next_sibling") },
  { key = "x", cb = tree_cb("cut") },
  { key = "c", cb = tree_cb("copy") },
  { key = "ca", cb = tree_cb("copy_absolute_path") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  -- { key = "v", cb = tree_cb("vsplit") },
  { key = "s", cb = tree_cb("split") },
  { key = "S", cb = tree_cb("system_open") },
  { key = "a", cb = tree_cb("create") },
  { key = "d", cb = tree_cb("remove") },
  { key = "r", cb = tree_cb("rename") },
  { key = "?", cb = tree_cb("toggle_help") },
  { key = "K", cb = tree_cb("first_sibling") },
  { key = "J", cb = tree_cb("last_sibling") },
  { key = "t", cb = tree_cb("tabnew") },
  { key = "[c", cb = tree_cb("prev_git_item") },
  { key = "]c", cb = tree_cb("next_git_item") },
  { key = "<C-r>", cb = tree_cb("full_rename") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "I", cb = tree_cb("toggle_ignored") },
  { key = "-", cb = tree_cb("dir_up") },
  { key = "<A-w>", cb = tree_cb("collapse_all") },
}

nvimtree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  renderer = {
    add_trailing = false,
    highlight_opened_files = 'icon',
    highlight_git = true,
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      show = {
        git = true,
        folder = true,
        file = true
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "﯊",
          ignored = "",
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "", -- 
          empty_open = "",
          symlink = "",
          symlink_open = "",
        }
      }
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 50,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = key_bindings,
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = true,
    }
  },
}
