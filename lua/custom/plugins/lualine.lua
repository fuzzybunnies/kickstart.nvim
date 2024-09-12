return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = { 'mode' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_b = { 'diff', 'diagnostics' },
        lualine_c = {
          { 'filename', path = 3 },
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      options = {
        theme = function()
          local custom_theme = require 'lualine.themes.powerline_dark'

          custom_theme.inactive.c = { fg = '#DFFF00', bg = '#4287f5' }
          custom_theme.normal.c = { fg = '#11110e', bg = '#4da4b0' }
          return custom_theme
        end,
      },
    }
  end,
}
