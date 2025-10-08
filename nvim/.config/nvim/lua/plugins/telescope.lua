return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "echasnovski/mini.icons",
    },
    config = function()
      local telescope = require("telescope")
      local layout = require("telescope.actions.layout")
      local mini_icons = require("mini.icons")
      local entry_display = require("telescope.pickers.entry_display")

      -- Helper: safely get path from entry
      local function get_entry_path(entry)
        if type(entry) == "string" then
          return entry
        elseif type(entry) == "table" and entry.name then
          return entry.name
        elseif type(entry) == "table" and entry.bufnr then
          return vim.api.nvim_buf_get_name(entry.bufnr)
        else
          return ""
        end
      end

      local function make_entry_with_icons()
        return function(entry)
          local path = get_entry_path(entry)
          if path == "" then path = "[No Name]" end

          local filename = vim.fn.fnamemodify(path, ":t")
          local ext = filename:match("^.+(%..+)$")
          local is_dir = vim.fn.isdirectory(path) == 1

          local icon, hl_group
          if is_dir then
            icon, hl_group = mini_icons.get("folder", "", { default = "" })
          else
            icon, hl_group = mini_icons.get("file", ext or "", { default = "" })
          end

          local displayer = entry_display.create({
            separator = "",
            items = { { remaining = true } },
          })

          local text = icon .. " " .. filename

          return {
            value = entry,
            display = function()
              return displayer({ { text, hl_group } })
            end,
            ordinal = filename,
          }
        end
      end

      telescope.setup({
        defaults = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          previewer = false,
          layout_config = { horizontal = { preview_width = 0 }, vertical = { preview_height = 0 } },
          mappings = {
            i = { ["<C-p>"] = layout.toggle_preview },
            n = { ["<C-p>"] = layout.toggle_preview },
          },
        },
        pickers = {
          find_files = { previewer = false, entry_maker = make_entry_with_icons() },
          git_files  = { previewer = false, entry_maker = make_entry_with_icons() },
          buffers    = { previewer = false, entry_maker = make_entry_with_icons() },
        },
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({ previewer = false }),
        },
      })

      telescope.load_extension("ui-select")
    end,
  },
}

