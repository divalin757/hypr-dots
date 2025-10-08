--return {
--    "OXY2DEV/markview.nvim",
--    lazy = false,
--    preview = {
--        icon_provider = "mini", -- "mini" or "devicons"
--    },
--    dependencies = {
--         "saghen/blink.cmp"
--    },
--};
return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}

