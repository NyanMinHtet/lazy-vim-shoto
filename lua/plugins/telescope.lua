return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
        },
      })
      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>fG", function()
        local builtin = require("telescope.builtin")
        local search_string = vim.fn.input("Search: ")

        local parts = {}
        for part in string.gmatch(search_string, "[^%s]+") do
          table.insert(parts, part)
        end

        local search_query = ""
        local file_type = ""
        local search_path = ""
        local command_args = {}

        local i = 1
        while i <= #parts do
          if parts[i] == "--type" and i + 1 <= #parts then
            file_type = parts[i+1]
            i = i + 2
          elseif parts[i] == "--path" and i + 1 <= #parts then
            search_path = parts[i+1]
            i = i + 2
          else
            if search_query == "" then
              search_query = parts[i]
            else
              search_query = search_query .. " " .. parts[i]
            end
            i = i + 1
          end
        end

        if file_type ~= "" then
          table.insert(command_args, "--type")
          table.insert(command_args, file_type)
        end

        local grep_opts = {
          additional_args = command_args,
          default_text = search_query,
        }

        if search_path ~= "" then
          grep_opts.search_dirs = { search_path }
        end

        builtin.live_grep(grep_opts)
      end, { desc = "Grep with advanced query" })
    end,
  },
}
