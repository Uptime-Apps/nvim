return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ensure_installed = {
      "angular-language-server",
      "autoflake",
      "autopep8",
      "codespell",
      "commitlint",
      "css-lsp",
      "cssmodules-language-server",
      "curlylint",
      "emmet-ls",
      "debugpy",
      "djlint",
      "eslint-lsp",
      "flake8",
      "glow",
      "isort",
      "json-lsp",
      "lua-language-server",
      "mypy",
      "prettierd",
      "pydocstyle",
      "pyflakes",
      "python-lsp-server",
      "shfmt",
      "stylua",
      "typescript-language-server",
    },
  },
  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}
