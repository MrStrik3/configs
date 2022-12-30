-- Mason stuff
local M = {
  'VonHeikemen/lsp-zero.nvim', -- plugin to link lsp autocompletion plugins together
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
    'rcarriga/nvim-notify',
    "jose-elias-alvarez/null-ls.nvim"
  }
}

function M.config()
	require('luasnip.loaders.from_vscode').lazy_load()

  local signs = { Error = '', Warn = '', Hint = '', Info = '' }

  local lsp = require('lsp-zero')
  -- lsp.preset('recommended')
  lsp.set_preferences({
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = true,
      configure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = true,
      call_servers = 'local',
      sign_icons = {
        error = signs.Error,
        warn = signs.Warn,
        hint = signs.Hint,
        info = signs.Info
      }
    })

  lsp.ensure_installed({ "sumneko_lua", "yamlls", "cssls", "bashls", "jdtls", "html", "pyright", "terraformls", "tsserver", "lemminx" })

  lsp.on_attach(function(client, bufnr)
    if vim.b.lsp_attached then return  end
    vim.b.lsp_attached = true

    require('nvim-navic').attach(client, bufnr)
  end)

  lsp.nvim_workspace()

  lsp.setup()

  -- nvim-notify
  vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local lvl = ({ 'ERROR', 'WARN', 'INFO', 'DEBUG' })[result.type]
    require("notify")({ result.message }, lvl, {
        title = 'LSP | ' .. client.name,
        timeout = 10000,
        keep = function()
          return lvl == 'ERROR' or lvl == 'WARN'
        end,
      })
  end

  -- null language server
  require("null-ls").setup({
      sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.code_actions.gitsigns,
      },
    })
end

return M
