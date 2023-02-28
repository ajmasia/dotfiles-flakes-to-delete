lvim.builtin.which_key.setup.window = {
	border = "shadow", -- none, single, double, shadow
	position = "bottom", -- bottom, top
	margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
	padding = { 0, 1, 1, 0 }, -- extra window padding [top, right, bottom, left]
	winblend = 0,
}

lvim.builtin.which_key.mappings["t"] = {
	name = "Diagnostics",
	t = { "<cmd>TroubleToggle<cr>", "trouble" },
	w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
	d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
	q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
	l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
	r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  c = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Get Capabilities" },
}

lvim.builtin.which_key.mappings["o"] = {
	name = "Obsidian",
	p = { "<cmd>ObsidianOpen<cr>", "Preview note" },
	f = { "<cmd>ObsidianQuickSwitch<cr>", "Find notes" },
	l = { "<cmd>ObsidianFollowLink<cr>", "Follow link" },
	s = { "<cmd>ObsidianSearch<cr>", "Search text in notes" },
	a = {
		function()
			---@diagnostic disable-next-line: param-type-mismatch
			local note_title = vim.fn.input("Title: ")
			-- TODO: Validate title here
			if note_title == "" then
				return
			end

			vim.cmd("ObsidianNew " .. note_title)
		end,
		"Add new note",
	},
	t = { "<cmd>ObsidianToday<cr>", "Open today note" },
	b = { "<cmd>ObsidianBacklinks<cr>", "Show note back links" },
}

-- Fix null-ls timeout error https://github.com/LunarVim/LunarVim/discussions/2767
lvim.builtin.which_key.mappings["l"]["f"] = {
	function()
		require("lvim.lsp.utils").format({ timeout_ms = 2000 })
	end,
	"Format",
}

lvim.builtin.which_key.mappings["."]  = {
  name = "Terminal",
  t = {"<cmd>ToggleTerm<cr>", "Toggle term" }
}
