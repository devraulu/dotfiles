-- --
-- -- AstroCommunity: import any community modules here
-- -- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- -- This guarantees that the specs are processed before any user plugins.
--
-- ---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.syntax.vim-sandwich" },
  { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-tree-pairs" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  -- { import = "astrocommunity.completion.supermaven-nvim" },
  { import = "astrocommunity.test.neotest" },
  -- { import = "astrocommunity.fuzzy-finder.fzf-lua" },
  { import = "astrocommunity.game.leetcode-nvim" },
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
}
