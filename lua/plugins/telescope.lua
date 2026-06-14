return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    config = function()
      require("telescope").setup({
        defaults = {
          previewer = true,
        -- Add this section to disable filetype detection in previews
        previewers = {
          buffer_previewer_maker = function(filepath, bufnr, opts)
            opts.use_ft_detect = false -- Disable filetype detection for preview
            return require("telescope.previewers.buffer_previewer").new(filepath, bufnr, opts)
          end,
        },
          file_ignore_patterns = {
            "^tmp/*",
            "^.git/",
            "^.cache/",
            "^target/",
            "^build/",
            "^dist/",
            "^bin/"
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          }
        }
      })
      pcall(function() require("telescope").load_extension("fzf") end)
    end,
  }
