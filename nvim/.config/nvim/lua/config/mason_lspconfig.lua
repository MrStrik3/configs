require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "yamlls", "cssls", "bashls", "jdtls", "html", "pyright", "terraformls", "tsserver", "lemminx" }
})

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  -- ["rust_analyzer"] = function ()
  --   require("rust-tools").setup {}
  -- end,
  ["sumneko_lua"] = function ()
    require("lspconfig").sumneko_lua.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }                                                                                                                                                                                                                                                       }
      }
    }
  end,
})