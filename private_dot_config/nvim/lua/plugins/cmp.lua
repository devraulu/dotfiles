return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
  dependencies = {
    "hrsh7th/cmp-cmdline", -- add cmp-cmdline as dependency of cmp
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        -- Build step needed for regex support in snippets
        if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then return end
        return "make install_jsregexp"
      end)(),
      config = function(plugin, opts)
        require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
        -- add more custom luasnip configuration such as filetype extend or custom snippets
        local luasnip = require "luasnip"
        luasnip.filetype_extend("javascript", { "javascriptreact" })
      end,
    },
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
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
  end,
  config = function(plugin, opts)
    local cmp = require "cmp"
    -- run cmp setup
    cmp.setup(opts)

    -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
  end,
}
