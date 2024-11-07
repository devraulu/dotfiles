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
    
    local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr)
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr)
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr)
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr)
  end,
}
