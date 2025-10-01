local palette = require("fallbox.palette").colors

local M = {}

function M.setup()
	-- limpiar highlights anteriores
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "fallbox"

	-- Definir highlights principales
	local highlights = {
		Normal = { fg = palette.amber, bg = palette.bg },
		Comment = { fg = palette.blue, italic = true },
		Constant = { fg = palette.orange },
		String = { fg = palette.pistachio },
		Identifier = { fg = palette.puce },
		Statement = { fg = palette.amber, bold = true },
		PreProc = { fg = palette.old_gold },
		Type = { fg = palette.pistachio, bold = true },
		Special = { fg = palette.orange },
		Underlined = { fg = palette.blue, underline = true },
		Error = { fg = palette.orange, bold = true },
		Todo = { fg = palette.bg, bg = palette.amber, bold = true },
		LineNr = { fg = palette.blue },
		CursorLineNr = { fg = palette.orange, bold = true },
		Visual = { bg = palette.puce },
		StatusLine = { fg = palette.amber, bg = palette.bg, bold = true },
		VertSplit = { fg = palette.blue, bg = palette.bg },
		Pmenu = { fg = palette.bg, bg = palette.amber },
		PmenuSel = { fg = palette.bg, bg = palette.orange, bold = true },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
