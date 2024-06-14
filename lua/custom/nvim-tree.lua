local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
end

-- pass to setup along with your other options
require('nvim-tree').setup {
  ---
  on_attach = my_on_attach,
  ---
  view = {
    centralize_selection = true,
    -- dynamic width
    width = {},
    float = {
      enable = true,
    },
  },
  renderer = {
    highlight_git = 'all',
    highlight_opened_files = 'all',
    highlight_modified = 'all',
    indent_markers = {
      enable = true,
      inline_arrows = false,
    },
    icons = {
      git_placement = 'after',
      show = {
        folder_arrow = false,
      },
      glyphs = {
        git = {
          untracked = '',
        },
      },
    },
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  git = {
    enable = true,
  },
  modified = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
  },
}

vim.api.nvim_set_hl(0, 'NvimTreeGitFileDirtyHL', { fg = '#f9ff40', bold = true })
vim.api.nvim_set_hl(0, 'NvimTreeGitFolderDirtyHL', { fg = '#f9ff40', bold = true })

vim.api.nvim_set_hl(0, 'NvimTreeGitFolderNewHL', { fg = '#ff9e64', bold = true })
vim.api.nvim_set_hl(0, 'NvimTreeGitFileNewHL', { fg = '#ff9e64', bold = true })
