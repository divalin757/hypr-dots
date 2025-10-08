-- lua/config/runner.lua
local M = {}

-- Extendable runners by filetype
M.runners = {
  python = { "python3" },
  sh = { "bash" },
  lua = { "lua" },
}

-- Detect command from shebang, executable, or filetype
local function detect_cmd(buf, file, ft)
  -- Read first line from buffer (works even if file is unsaved)
  local first_line = (vim.api.nvim_buf_get_lines(buf, 0, 1, false) or {})[1] or ""

  -- 1️⃣ Shebang detection
  if first_line:match("^#!") then
    local parts = vim.split(first_line:sub(3), "%s+")
    if parts[1]:match("env$") and parts[2] then
      table.remove(parts, 1)
    end
    table.insert(parts, file)
    return parts
  end

  -- 2️⃣ Executable file
  if vim.fn.getfperm(file):match("x") then
    return { file }
  end

  -- 3️⃣ Filetype fallback
  local runner = M.runners[ft]
  if runner then
    local cmd = {}
    for _, p in ipairs(runner) do table.insert(cmd, p) end
    table.insert(cmd, file)
    return cmd
  end

  return nil
end

-- Close terminal helper
local function close_term_buf(term_buf)
  if not vim.api.nvim_buf_is_valid(term_buf) then return end
  local wins = vim.fn.win_findbuf(term_buf)
  for _, w in ipairs(wins) do
    pcall(vim.api.nvim_win_close, w, true)
  end
  if vim.api.nvim_buf_is_valid(term_buf) then
    pcall(vim.api.nvim_buf_delete, term_buf, { force = true })
  end
end

-- Main runner
function M.run_file()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local file = vim.fn.expand("%:p")

  if file == "" then
    vim.notify("Please save the buffer before running", vim.log.levels.ERROR)
    return
  end

  -- Save buffer
  if vim.bo.modified then vim.cmd("write") end

  local cmd = detect_cmd(buf, file, ft)
  if not cmd then
    vim.notify("No runner configured for filetype: " .. (ft or "<unknown>"), vim.log.levels.ERROR)
    return
  end

  -- Create bottom terminal
  vim.cmd("botright split | resize 8")
  local term_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, term_buf)

  -- Run command directly (no shell prompt)
  local job = vim.fn.termopen(cmd, {
    cwd = vim.fn.getcwd(),
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        vim.schedule(function()
          vim.notify("Run finished with exit code " .. exit_code, vim.log.levels.WARN)
        end)
      end
    end,
  })

  -- Hide buffer from buffer list
  vim.api.nvim_buf_set_name(term_buf, "Run: " .. vim.fn.fnamemodify(file, ":t"))
  vim.api.nvim_buf_set_option(term_buf, "buftype", "terminal")
  vim.api.nvim_buf_set_option(term_buf, "buflisted", false)
  vim.api.nvim_buf_set_option(term_buf, "filetype", "runner")

  -- Map q to close the runner (normal + terminal mode)
  local function close_fn()
    close_term_buf(term_buf)
  end
  vim.keymap.set("n", "q", close_fn, { buffer = term_buf, desc = "Close runner" })
  vim.keymap.set("t", "q", function()
    -- exit terminal-mode first
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    close_fn()
  end, { buffer = term_buf, desc = "Close runner (terminal)" })

  -- Enter terminal insert mode automatically
  vim.cmd("startinsert")
end

-- Custom command & keymap
vim.api.nvim_create_user_command("CodeRun", M.run_file, { desc = "Run current file" })
vim.keymap.set("n", "<leader>x", M.run_file, { desc = "Run current file" })

return M
