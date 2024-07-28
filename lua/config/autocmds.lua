-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Function to set Python interpreter from pyenv
local function set_pyenv_python()
  -- Check if 'pyenv' is executable
  if os.execute("command -v pyenv >/dev/null 2>&1") then
    -- Get the path of the Python interpreter managed by pyenv
    local handle = io.popen("pyenv which python", "r")
    if handle then
      local pyenv_python_path = handle:read("*a")
      handle:close()

      -- Trim any trailing whitespace (including newline)
      pyenv_python_path = pyenv_python_path:gsub("%s+$", "")

      if pyenv_python_path ~= "" then
        -- Set the Python interpreter for Neovim
        vim.g.python3_host_prog = pyenv_python_path
      end
    end
  end
end

-- Autocommand to set Python interpreter for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = set_pyenv_python,
})
