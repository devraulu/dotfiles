return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5', -- Recommended
  --   lazy = false,
  --   -- config = function()
  --   --   -- local mason_registry = require 'mason-registry'
  --   --   -- local codelldb = mason_registry.get_package 'codelldb'
  --   --   -- local extension_path = codelldb:get_install_path() .. '/extension/'
  --   --   -- local codelldb_path = extension_path .. 'adapter/codelldb'
  --   --   -- local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
  --   --   --
  --   --   -- local extension_path = '/usr/lib/codelldb'
  --   --   -- local codelldb_path = extension_path .. 'adapter/codelldb'
  --   --   -- local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
  --   --   -- local cfg = require 'rustaceanvim.config'
  --   --   -- vim.g.rustaceanvim = {
  --   --   --   dap = { adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path) },
  --   --   --   server = {
  --   --   --     ---@param project_root string Path to the project root
  --   --   --     settings = function(project_root)
  --   --   --       local ra = require 'rustaceanvim.config.server'
  --   --   --       return ra.load_rust_analyzer_settings(project_root, {
  --   --   --         settings_file_pattern = 'rust-analyzer.json',
  --   --   --       })
  --   --   --     end,
  --   --   --   },
  --   --   -- }
  --   -- end,
  -- },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup {
        completion = {
          -- coq = { enabled = true },
          cmp = { enabled = true },
        },
      }
    end,
  },
}
