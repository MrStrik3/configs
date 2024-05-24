-- LSP & Autocompletion configurations
local signs = { error = '', warn = '', hint = '󰛨', info = '' }

return {
  -- LSP configs
  -- vim.lsp.buf.format({ async = false }),
  {
    'VonHeikemen/lsp-zero.nvim', -- plugin to link lsp autocompletion plugins together
    branch = 'v3.x',
    lazy = false,
    config = false,
    init = function()
      local lspzero = require('lsp-zero')
      lspzero.set_sign_icons(signs)
      lspzero.extend_lspconfig()
    end,
  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    cmd = 'Mason',
    opts = {},
  },

  { 'rcarriga/nvim-notify', },

  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason-lspconfig').setup({
        ensured_installed = { 'lua_ls', 'yamlls', 'cssls', 'bashls', 'jdtls', 'html', 'pyright', 'terraformls',
          'tsserver', 'lemminx', },
        handlers = {
          require('lsp-zero').default_setup,
          lua_ls = function()
            require('lspconfig').lua_ls.setup({
              on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                  return
                end
                client.config.settings =
                    vim.tbl_deep_extend('force', client.config.settings,
                      {
                        Lua = {
                          runtime = {
                            version = 'LuaJIT',
                          },
                          -- Make the server aware of Neovim runtime files
                          workspace = {
                            checkThirdParty = false,
                            library = {
                              vim.env.VIMRUNTIME,
                            },
                          },
                          diagnostics = {
                            enable = true,
                            globals = { 'vim' },
                            unused = { 'unused-local', 'lowercase-global' }
                          },
                          hint = {
                            enable = true,
                          },
                          format = {
                            enable = true,
                            defaultConfig = {
                              indent_style = 'space',
                              indent_size = '2'
                            }
                          }
                        },
                      }
                    )

                client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
                -- end
                return true
              end,
            })
          end,
        },
      })
    end,

    init = function(
    )
      local lspzero = require('lsp-zero')

      lspzero.on_attach(function(client, bufnr)
        if vim.b.lsp_attached then
          -- if vim.lsp.is_attached(bufnr, client) then return
        end

        if client.server_capabilities.documentSymbolProvider then
          require('nvim-navic').attach(client, bufnr)
        end
      end
      )

      -- nvim-notify
      vim.notify = require('notify')
      vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        local lvl = ({ 'ERROR', 'WARN', 'INFO', 'DEBUG', })[result.type]
        require('notify')({ result.message, }, lvl,
          {
            title = 'LSP | ' .. client.name,
            timeout = 10000,
            keep = function() return lvl == 'ERROR' or lvl == 'WARN' end,
          })
      end

      -- local opts = { noremap = true, silent = true, buffer = bufnr }
      local opts = { noremap = true, silent = true, buffer = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>rv", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true })
      vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
      -- vim.keymap.set('x', '<F4>', vim.lsp.buf.range_code_action, opts)

      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, opts)
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'VonHeikemen/lsp-zero.nvim',
      {
        'SmiteshP/nvim-navic',
        opts = {
          highlight = true,
          separator = "  ",
          icons = {
            File = " ",
            Module = " ",
            Namespace = " ",
            Package = " ",
            Class = " ",
            Method = " ",
            Property = " ",
            Field = " ",
            Constructor = " ",
            Enum = " ",
            Interface = " ",
            Function = " ",
            Variable = " ",
            Constant = " ",
            String = " ",
            Number = " ",
            Boolean = " ",
            Array = " ",
            Object = " ",
            Key = " ",
            Null = " ",
            EnumMember = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
          },
          safe_output = true,
          preference = { 'lua_ls', 'null-ls' },
          auto_attach = true,
        }
      }
    },
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,
    -- opts = true,
  },

  {
    'folke/neodev.nvim',
    lazy = false,
    opts = true,
  },
  {
    'smjonas/inc-rename.nvim',
    -- cmd = 'IncRename',
    main = 'inc_rename',
    event = "BufReadPre",
    opts = {
      input_buffer_type = "dressing"
    },
  }, -- Renaming a variable plugin

  -- Autocompletion configurations
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    opts = {
      sources = {
        { name = 'nvim_lsp', },
        { name = 'path', },
        { name = 'luasnip',  keyword_length = 2, },
        { name = 'nvim_lua', },
        { name = 'buffer',   keyword_length = 3, },
      },
    },
    config = function(_plug, opts)
      require('luasnip.loaders.from_vscode').lazy_load()

      local cmp =
          require('cmp')
      local lspkind = require('lspkind')

      opts.formatting =
      {
        fields = { 'kind', 'abbr', 'menu', },
        format = lspkind.cmp_format({
          --     -- mode = "symbol_text", -- show only symbol annotations
          mode = 'text_symbol', -- show only symbol annotations
          menu = {
            buffer = '[Buffer]',
            path = '[Path]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            nvim_lua = '[Lua]',
            cmp_tabnine = '[T9]',
          },
          --     maxwidth = 80,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          --     ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          --
          --     -- The function below will be called before any actual modifications from lspkind
          --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(entry, vim_item)
            vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = 'symbol_text', })
            return vim_item
          end,
        }),
      }

      opts.mapping = cmp.mapping.preset.insert({
        -- ["<C-space>"] = cmp.mapping.complete(),
        ['<C-space>'] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select, })
            else
              cmp.complete()
            end
          end,
        }),

        ['<C-l>'] = cmp.mapping.confirm({ select = true, }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-U>'] = cmp.mapping.scroll_docs(-4),
        ['<C-D>'] = cmp.mapping.scroll_docs(4),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, }),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, }),
        ['<CR>'] = cmp.mapping({ i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, })
          else
            fallback()
          end
        end,
          s = cmp.mapping.confirm({ select = true, }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }),
        }),
      })
      cmp.setup(opts)
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      {
        'tzachar/cmp-tabnine',
        build = function()
          if vim.fn.has('win32') then
            return './install.ps1'
          else
            return './install.sh'
          end
        end,
      },
    },
  },

  {
    'L3MON4D3/LuaSnip',
    version = '2.*',
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
  },
  {
    'rafamadriz/friendly-snippets',
  },
}
