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

