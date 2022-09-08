local colors = require('everblush.core').get_colors()
local lualine = require('lualine')
require("battery").setup({})
require'mind'.setup()
require'colorizer'.setup()


require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "java" },
  sync_install = false,
  auto_install = true,
  
  highlight = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, --debounced time for highlighting notes in the playground from source code 
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_language_display = 'a',
      toggle_language_nodes = 'a',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

require('everblush').setup({
    override = {
      LineNr = { fg = colors.comment },
      StatusLineNC = { bg = colors.color1, fg = colors.background },
      CursorLineNr = { fg = colors.color2 }
    },
  })

--Nvim Toggler
local t = vim.tbl_add_reverse_lookup({
  ['true'] = 'false',
  ['yes'] = 'no',
  ['on'] = 'off',
  ['left'] = 'right',
  ['up'] = 'down',
  ['male'] = 'female',
  ['minty'] = 'finty',
})

local setup = function(u_tbl)
  t = vim.tbl_extend('force', t, vim.tbl_add_reverse_lookup(u_tbl or {}))
end

local c = {
  ['n'] = 'norm! ciw',
  ['v'] = 'norm! c',
}

local toggle = function()
  local i = vim.tbl_get(t, vim.fn.expand('<cword>'))
  xpcall(function()
    vim.cmd(vim.tbl_get(c, vim.api.nvim_get_mode().mode) .. i)
  end, function()
    print('toggler: unsupported value.')
  end)
end

local opts = { noremap = true, silent = true }
vim.keymap.set({ 'n', 'v' }, '<leader>i', toggle, opts)

local nvimbattery = {
  function()
    return require("battery").get_status_line()
  end,
  color = { fg = colors.violet, bg = colors.bg },
}
local custom_fname = require('lualine.components.filename'):extend()
local highlight = require'lualine.highlight'
local default_status_colors = { saved = '#228B22', modified = '#C70039' }

function custom_fname:init(options)
  custom_fname.super.init(self, options)
  self.status_colors = {
    saved = highlight.create_component_highlight_group(
      {bg = default_status_colors.saved}, 'filename_status_saved', self.options),
    modified = highlight.create_component_highlight_group(
      {bg = default_status_colors.modified}, 'filename_status_modified', self.options),
  }
  if self.options.color == nil then self.options.color = '' end
end

function custom_fname:update_status()
  local data = custom_fname.super.update_status(self)
  data = highlight.component_format_highlight(vim.bo.modified
                                              and self.status_colors.modified
                                              or self.status_colors.saved) .. data
  return data
end

lualine.setup {
  options = {
    theme = 'everblush',
    component_separators = '',
    section_separators = '',
    globalstatus = true,
  },
  sections = { 
    lualine_c = {custom_fname},
    lualine_z = { nvimbattery },
    lualine_y = { "os.date('%A %X')", 'data', "require'lsp-status'.status()" }
  },
}



return { setup = setup, toggle = toggle }
