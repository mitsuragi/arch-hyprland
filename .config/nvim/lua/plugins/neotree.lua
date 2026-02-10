vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>")

require("neo-tree").setup({
	close_if_last_window = true,
	-- popup_border_style = "",
	enable_git_status = true,
	enable_diagnostics = true,
	
	window = {
		position = 'right',
		width = 40,
		mappings = {
			['o'] = 'open',
      ["h"] = function(state)
        local node = state.tree:get_node()
          if node.type == 'directory' and node:is_expanded() then
            require'neo-tree.sources.filesystem'.toggle_directory(state, node)
          else
            require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
          end
        end,
      ["l"] = function(state)
        local node = state.tree:get_node()
          if node.type == 'directory' then
            if not node:is_expanded() then
              require'neo-tree.sources.filesystem'.toggle_directory(state, node)
            elseif node:has_children() then
              require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
            end
          end
        end,
		},
	},
	git_status = {
		symbols = {
			added = "",
			modified = "",
			deleted = "✖",
			renamed = "󰁕",
			-- status type
			untracked = "",
			ignored = "",
			unstaged = "󰄱",
			staged = "",
			conflict = "",
		},
	},
	name = {
		use_git_status_colors = true,
		highlight = "NeoTreeFileName",
	},
	event_handlers = {
		{
			event = "file_open_requested",
			handler = function ()
				require('neo-tree.command').execute({ action = "close" })
			end
		}
	}
})

