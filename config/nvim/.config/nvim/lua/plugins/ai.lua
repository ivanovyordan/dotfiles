-- Coding with AI
return {
  "joshuavial/aider.nvim",

	opts = {
		-- auto_manage_context = false,
		default_bindings = false,
	},

	keys = function()
		return {
			{
				"<leader>ao",
				"<cmd>lua AiderOpen()<cr>i",
				desc = "Aider Open",
			},
			{
				"<leader>ab",
				"<cmd>lua AiderBackground()<cr>",
				desc = "Aider Background",
				-- defaults to message "Complete as many todo items as you can and remove the comment for any item you complete."
			},
		}
	end,
}
