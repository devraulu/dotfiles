-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'Decodetalkers/csharpls-extended-lsp.nvim',
    -- {
    --   'Hoffs/omnisharp-extended-lsp.nvim',
    --   name = 'omnisharp_extended',
    -- },
    {
      'pmizio/typescript-tools.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
      opts = { settings = {
        tsserver_plugins = {
          '@styled/typescript-styled-plugin',
        },
      } },
    },
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.lsp.set_log_level 'debug'

    -- Brief Aside: **What is LSP?**
    --
    -- LSP is an acronym you've probably heard, but might not understand what it is.
    --
    -- LSP stands for Language Server Protocol. It's a protocol that helps editors
    -- and language tooling communicate in a standardized fashion.
    --
    --
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { focusable = false })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        --
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        local fzf = require 'fzf-lua'

        map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gr', fzf.lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', fzf.lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', fzf.lsp_typedefs, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>ds', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace
        --  Similar to document symbols, except searches over your whole project.
        map('<leader>ws', fzf.lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header
        --
        -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gD', fzf.lsp_declarations, '[G]oto [D]eclaration')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP Specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.definition.dynamicRegistration = true
    -- capabilities.textDocument.hover.dynamicRegistration = true
    -- capabilities.textDocument.rename.dynamicRegistration = true
    -- capabilities.textDocument.codeAction.dynamicRegistration = true
    -- capabilities.textDocument.formatting.dynamicRegistration = true
    -- capabilities.textDocument.rangeFormatting.dynamicRegistration = true
    -- capabilities.textDocument.references.dynamicRegistration = true
    -- capabilities.textDocument.completion.dynamicRegistration = true
    -- capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    local servers = {
      clangd = {},
      -- mdx_analyzer = {},
      --
      gopls = {},
      pyright = {},
      -- rust_analyzer = {},
      -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
      --
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- But for many setups, the LSP (`tsserver`) will work just fine
      -- tsserver = {},
      --
      astro = {},
      angularls = {},
      lua_ls = {
        -- cmd = {...},
        -- filetypes { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded
              -- for your neovim configuration.
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
              -- If lua_ls is really slow on your computer, you can try this instead:
              -- library = { vim.env.VIMRUNTIME },
            },
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      -- omnisharp = {
      --   -- Set the path to the Omnisharp executable if necessary
      --   cmd = { '/home/hex/omnisharp-linux-x64/run', '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
      --
      --   -- Add any initialization options if needed
      --   init_options = {
      --     useModernNet = true, -- Set to true if you're using .NET Core
      --   },
      --
      --   -- Include the handlers from omnisharp_extended
      --
      --   -- Include the updated capabilities
      --   capabilities = capabilities,
      --   handlers = {
      --
      --     ['textDocument/definition'] = require('omnisharp_extended').definition_handler,
      --     ['textDocument/typeDefinition'] = require('omnisharp_extended').type_definition_handler,
      --     ['textDocument/references'] = require('omnisharp_extended').references_handler,
      --     ['textDocument/implementation'] = require('omnisharp_extended').implementation_handler,
      --   },
      -- },
    }

    -- Ensure the servers and tools above are installed
    --  To check the current status of installed tools and/or manually install
    --  other tools, you can run
    --    :Mason
    --
    --  You can press `g?` for help in this menu
    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
      'csharp-language-server',
      'csharpier',
      'netcoredbg',
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
        csharp_ls = {
          handlers = {
            ['textDocument/definition'] = function(...)
              require('csharpls_extended').handler(...)
            end,
            ['textDocument/typeDefinition'] = function(...)
              require('csharpls_extended').handler(...)
            end,
          },
        },
        -- ['omnisharp'] = function()
        --   local omnisharp_bin = '/usr/local/bin/omnisharp.http/run'
        --   local config = {
        --     cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
        --     handlers = {
        --
        --       ['textDocument/definition'] = require('omnisharp_extended').definition_handler,
        --       ['textDocument/typeDefinition'] = require('omnisharp_extended').type_definition_handler,
        --       ['textDocument/references'] = require('omnisharp_extended').references_handler,
        --       ['textDocument/implementation'] = require('omnisharp_extended').implementation_handler,
        --     },
        --     capabilities = vim.tbl_deep_extend('force', {}, capabilities, {}),
        --   }
        --
        --   require('lspconfig').omnisharp.setup(config)
        -- end,
      },
    }
  end,
}
-- return {
--   -- CSharp support
--   {
--     'nvim-treesitter/nvim-treesitter',
--     optional = true,
--     opts = function(_, opts)
--       if opts.ensure_installed ~= 'all' then
--         opts.ensure_installed = opts.ensure_installed or {}
--         table.insert(opts.ensure_installed, 'c_sharp')
--       end
--     end,
--   },
--   {
--     'jay-babu/mason-null-ls.nvim',
--     optional = true,
--     opts = function(_, opts)
--       opts.ensure_installed = opts.ensure_installed or {}
--       table.insert(opts.ensure_installed, 'csharpier')
--     end,
--   },
--   {
--     'williamboman/mason-lspconfig.nvim',
--     optional = true,
--     opts = function(_, opts)
--       opts.ensure_installed = opts.ensure_installed or {}
--       table.insert(opts.ensure_installed, 'csharp_ls')
--     end,
--   },
--   -- {
--   --   'Decodetalkers/csharpls-extended-lsp.nvim',
--   --   dependencies = {
--   --     {
--   --       'neovim/nvim-lspconfig',
--   --       opts = {
--   --         config = {
--   --           csharp_ls = {
--   --             handlers = {
--   --               ['textDocument/definition'] =
--   --                 require('csharpls_extended').handler,
--   --               ['textDocument/typeDefinition'] =
--   --                 require('csharpls_extended').handler
--   --             },
--   --           },
--   --         },
--   --       },
--   --     },
--   --   },
--   -- },
--   {
--     'jay-babu/mason-nvim-dap.nvim',
--     optional = true,
--     opts = function(_, opts)
--       opts.ensure_installed = opts.ensure_installed or {}
--       table.insert(opts.ensure_installed, 'coreclr')
--     end,
--   },
--   {
--     'WhoIsSethDaniel/mason-tool-installer.nvim',
--     optional = true,
--     opts = function(_, opts)
--       opts.ensure_installed = opts.ensure_installed or {}
--       vim.list_extend(opts.ensure_installed, { 'csharp-language-server', 'csharpier', 'netcoredbg' })
--     end,
--   },
--   {
--     'nvim-neotest/neotest',
--     optional = true,
--     dependencies = { 'Issafalcon/neotest-dotnet' },
--     opts = function(_, opts)
--       opts.adapters = opts.adapters or {}
--       table.insert(opts.adapters, require 'neotest-dotnet')
--     end,
--   },
--
--   -- LSP Configuration & Plugins
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       'williamboman/mason.nvim',
--       'williamboman/mason-lspconfig.nvim',
--       'WhoIsSethDaniel/mason-tool-installer.nvim',
--       'Decodetalkers/csharpls-extended-lsp.nvim',
--       {
--         'pmizio/typescript-tools.nvim',
--         dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
--         opts = {
--           settings = {
--             tsserver_plugins = {
--               '@styled/typescript-styled-plugin',
--             },
--           },
--         },
--       },
--       { 'j-hui/fidget.nvim', opts = {} },
--     },
--     config = function()
--       vim.lsp.set_log_level 'debug'
--
--       vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
--       vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { focusable = false })
--
--       vim.api.nvim_create_autocmd('LspAttach', {
--         callback = function(event)
--           local map = function(keys, func, desc)
--             vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
--           end
--
--           local fzf = require 'fzf-lua'
--           map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
--           map('gr', fzf.lsp_references, '[G]oto [R]eferences')
--           map('gI', fzf.lsp_implementations, '[G]oto [I]mplementation')
--           map('<leader>D', fzf.lsp_typedefs, 'Type [D]efinition')
--           map('<leader>ds', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')
--           map('<leader>ws', fzf.lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
--           map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--           map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--           map('K', vim.lsp.buf.hover, 'Hover Documentation')
--           map('gD', fzf.lsp_declarations, '[G]oto [D]eclaration')
--
--           local client = vim.lsp.get_client_by_id(event.data.client_id)
--           if client and client.server_capabilities.documentHighlightProvider then
--             vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--               buffer = event.buf,
--               callback = vim.lsp.buf.document_highlight,
--             })
--             vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--               buffer = event.buf,
--               callback = vim.lsp.buf.clear_references,
--             })
--           end
--         end,
--       })
--
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--       local servers = {
--         clangd = {},
--         gopls = {},
--         pyright = {},
--         astro = {},
--         angularls = {},
--         lua_ls = {
--           settings = {
--             Lua = {
--               runtime = { version = 'LuaJIT' },
--               workspace = {
--                 checkThirdParty = false,
--                 library = vim.api.nvim_get_runtime_file('', true),
--               },
--               completion = { callSnippet = 'Replace' },
--             },
--           },
--         },
--         csharp_ls = {
--           handlers = {
--             ['textDocument/definition'] = function(...)
--               require('csharpls_extended').handler(...)
--             end,
--             ['textDocument/typeDefinition'] = function(...)
--               require('csharpls_extended').handler(...)
--             end,
--           },
--         },
--       }
--
--       require('mason').setup()
--
--       local ensure_installed = vim.tbl_keys(servers)
--       vim.list_extend(ensure_installed, { 'stylua', 'csharp-language-server', 'csharpier', 'netcoredbg' })
--       require('mason-tool-installer').setup { ensure_installed = ensure_installed }
--
--       require('mason-lspconfig').setup {
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--             require('lspconfig')[server_name].setup(server)
--           end,
--         },
--       }
--     end,
--   },
-- }
