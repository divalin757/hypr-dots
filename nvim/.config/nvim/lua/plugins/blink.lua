return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  opts = {
    keymap = {
        preset = 'enter', -- Enter to confirm selection
        ["<Down>"] = {}, -- Disable down arrow
        ["<Up>"] = {},   -- Disable up arrow
        ["<Tab>"] = {
          function(cmp) return cmp.select_next() end,
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp) return cmp.select_prev() end,
          "fallback",
        },
      },
      completion = {
        list = {
    --      selection = "auto_insert",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
        menu = {
          border = "rounded",
          draw = { gap = 2 },
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        },
  },
 },
}
