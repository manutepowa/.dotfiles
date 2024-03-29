return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  keys = {
    { '<A-e>', "<cmd>NvimTreeToggle<cr>", noremap = true, silent = true, desc = "nvim-tree" },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local icons = require("config.icons")
    local present, nvimtree = pcall(require, "nvim-tree")
    if not present then
      return
    end

    function FindFiles()
      local node = require("nvim-tree.lib").get_node_at_cursor()
      local abspath = node.link_to or node.absolute_path
      local is_folder = node.open ~= nil
      local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
      require("telescope.builtin").find_files({
        cwd = basedir,
      })
    end

    function GrepFiles()
      local node = require("nvim-tree.lib").get_node_at_cursor()
      local abspath = node.link_to or node.absolute_path
      local is_folder = node.open ~= nil
      local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
      require("telescope.builtin").live_grep({
        cwd = basedir,
      })
    end

    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', '<Tab>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<CR>', api.node.open.preview, opts('Open Preview'))
      vim.keymap.set('n', '<A-w>', api.tree.collapse_all, opts('Collapse'))
      vim.keymap.set('n', 'e', 'e', opts('Nothing'))
      vim.keymap.set('n', 'ff', FindFiles, opts('Find files'))
      vim.keymap.set('n', 'fg', GrepFiles, opts('GrepFiles'))
      vim.keymap.set('n', 'S', api.node.run.system, opts('GrepFiles'))
    end

    nvimtree.setup {
      on_attach = my_on_attach,
      open_on_tab = false,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
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
            default = icons.ui.Text,
            symlink = icons.ui.FileSymlink,
            bookmark = icons.ui.BookMark,
            folder = {
              arrow_closed = icons.ui.TriangleShortArrowRight,
              arrow_open = icons.ui.TriangleShortArrowDown,
              default = icons.ui.Folder,
              open = icons.ui.FolderOpen,
              empty = icons.ui.EmptyFolder,
              empty_open = icons.ui.EmptyFolderOpen,
              symlink = icons.ui.FolderSymlink,
              symlink_open = icons.ui.FolderOpen,
            },
            git = {
              unstaged = icons.git.FileUnstaged,
              staged = icons.git.FileStaged,
              unmerged = icons.git.FileUnmerged,
              renamed = icons.git.FileRenamed,
              untracked = icons.git.FileUntracked,
              deleted = icons.git.FileDeleted,
              ignored = "",
            },
          },
        },
      },
      hijack_directories = {
        enable = false,
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
      live_filter = {
        prefix = "[SEARCH]: ",
        always_show_folders = false,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      view = {
        centralize_selection = true,
        width = 50,
        side = "left",
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
  end,
}
