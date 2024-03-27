return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    for i = 1, 9, 1 do
      vim.keymap.set('n', '<leader>' .. i .. '', function()
        harpoon:list():select(i)
      end)
    end

    vim.keymap.set('n', '<leader>h', function()
      harpoon:list():append()
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = 'Previous harpoon window' })
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = 'Next harpoon window' })

    -- Telescope setup
    --
    local conf = require('telescope.config').values

    local make_finder = function()
      local paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(paths, item.value)
      end

      return require('telescope.finders').new_table {
        results = paths,
      }
    end

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
          attach_mappings = function(prompt_bufnr, map)
            map(
              'i',
              '<D-d>', -- your mapping here
              function()
                local state = require 'telescope.actions.state'
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_buffer_number)

                harpoon:list():removeAt(selected_entry.index)
                current_picker:refresh(make_finder())
              end
            )

            return true
          end,
        })
        :find()
    end

    -- vim.keymap.set('n', '<leader>-', function()
    --   toggle_telescope(harpoon:list())
    -- end, { desc = 'Open harpoon window' })
    --
    vim.keymap.set('n', '<leader>-', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}
