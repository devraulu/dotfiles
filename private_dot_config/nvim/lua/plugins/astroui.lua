-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

vim.g.everforest_transparent_background = 2
vim.g.nord_disable_background = true

---@type LazySpec
return {
  {

    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      -- colorscheme = "rose-pine-moon",
      -- colorscheme = "dogrun",
      -- colorscheme = "everforest",
      -- colorscheme = "poimandres",
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = "dracula",
      colorscheme = "mellifluous",
      -- colorscheme = "gruvbox",
      -- colorscheme = "night-owl",
      -- colorscheme = "iceberg",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "cyberdream",
      -- colorscheme = "nord",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          -- Normal = { bg = "#000000" },
        },
        astrodark = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
  { "rose-pine/neovim", name = "rose-pine", lazy = true, opts = {
    styles = { transparency = true },
  } },
  {
    "olivercederborg/poimandres.nvim",
    opts = {
      disable_background = true,
      disabled_float_background = true,
    },
  },
  { "catppuccin/nvim", opts = { transparent_background = true } },
  { "rebelot/kanagawa.nvim", opts = { transparent = true } },
  {
    "ramojus/mellifluous.nvim",
    opts = function()
      -- vim.cmd "Mellifluous toggle_transparency<CR>"
      return {}
    end,
  },
  -- {
  --   "Mofiqul/dracula.nvim",
  --   opts = {
  --     transparent_bg = true, -- default false
  --   },
  -- },
  --
  --
  { "ellisonleao/gruvbox.nvim", opts = { transparent_mode = true } },
}
