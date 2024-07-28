return {
  "neovim/nvim-lspconfig",
  opts = {
<<<<<<< Updated upstream
    servers = {
      eslint = {},
      emmet_ls = {},
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
=======
    servers = { eslint = {}, emmet_ls = {} },
    setup = {
      eslint = function()
        require("lazyvim.util").on_attach(function(client)
>>>>>>> Stashed changes
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
