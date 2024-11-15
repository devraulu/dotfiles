-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
-- -- customize treesitter parsers
--  {
--    "nvim-treesitter/nvim-treesitter",
--    opts = function(_, opts)
--      -- list like portions of a table cannot be merged naturally and require the user to merge it manually
--      -- check to make sure the key exists
--      if not opts.ensure_installed then
--        opts.ensure_installed = {}
--      end
--      vim.list_extend(opts.ensure_installed, {
--        "lua",
--        "vim",
--        -- add more arguments for adding more treesitter parsers
--      })
--    end,
--  },
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",

  opts = function(_, opts)
    -- list like portions of a table cannot be merged naturally and require the user to merge it manually
    -- check to make sure the key exists
    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<C-CR>",
        node_decremental = "<S-CR>",
      },
    }
    -- if not opts.ensure_installed then opts.ensure_installed = {} end
    -- vim.list_extend(opts.ensure_installed, {
    --   "lua",
    --   "vim",
    --   -- add more arguments for adding more treesitter parsers
    -- })
  end,
}
