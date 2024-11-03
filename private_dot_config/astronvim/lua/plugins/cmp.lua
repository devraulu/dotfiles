return {
  -- Override the default nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        -- Build step needed for regex support in snippets
        if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then return end
        return "make install_jsregexp"
      end)(),
    },
    "saadparwaiz1/cmp_luasnip",

    -- Additional completion sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "rafamadriz/friendly-snippets",
    "kristijanhusak/vim-dadbod-completion",
    "supermaven-inc/supermaven-nvim",
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup {}

    -- Set up snippet expansion
    opts.snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    }

    -- Configure completion options
    opts.completion = { completeopt = "menu,menuone,noselect" }

    -- Set up key mappings
    opts.mapping = cmp.mapping.preset.insert {
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-y>"] = cmp.mapping.confirm { select = true },
      ["<C-Space>"] = cmp.mapping.complete {},
      ["<C-l>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function(fallback)
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }

    -- Configure sources
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "nvim_lsp_signature_help" },
    }, {
      { name = "buffer" },
    })

    -- Adjust matching settings if necessary
    opts.matching = { disallow_symbol_nonprefix_matching = false }
  end,
  config = function(_, opts)
    local cmp = require "cmp"
    -- Apply the configuration
    cmp.setup(opts)

    -- Set up cmdline for searching (`/` and `?`)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Set up cmdline for commands (`:`)
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })

    -- Configure completion for SQL files
    cmp.setup.filetype({ "sql" }, {
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}
