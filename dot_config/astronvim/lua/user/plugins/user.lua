return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- "easymotion/vim-easymotion",
  -- "justinmk/vim-sneak",
  -- { "jlcrochet/vim-razor" },
  {

    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
    },
  },
  -- {
  -- "github/copilot.vim",
  -- opts = { suggestion = { enabled = true, auto_trigger = false, keymap = { accept = "<C-a>" } } },
  -- },
}
