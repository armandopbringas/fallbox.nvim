local palette = require("fallbox.palette").colors

local M = {}

function M.setup()
	-- Limpiar lo que había antes
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "fallbox"

	-- 🎨 Highlights generales
	local hl = {
		Normal = { fg = palette.amber, bg = palette.bg },
		Comment = { fg = palette.blue, italic = true },
		Constant = { fg = palette.old_gold },
		String = { fg = palette.pistachio },
		Identifier = { fg = palette.puce },
		Statement = { fg = palette.amber, bold = true },
		PreProc = { fg = palette.orange },
		Type = { fg = palette.puce, bold = true },
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

	-- 🌲 Highlights de Treesitter
	local ts = {
		["@keyword"] = { fg = palette.amber, bold = true },
		["@keyword.function"] = { fg = palette.amber, bold = true },
		["@conditional"] = { fg = palette.amber },
		["@repeat"] = { fg = palette.amber },
		["@operator"] = { fg = palette.amber },

		["@function"] = { fg = palette.blue, bold = true },
		["@function.call"] = { fg = palette.blue },
		["@method"] = { fg = palette.blue },
		["@constructor"] = { fg = palette.puce },

		["@variable"] = { fg = palette.puce },
		["@variable.parameter"] = { fg = palette.amber },
		["@constant"] = { fg = palette.old_gold },
		["@constant.builtin"] = { fg = palette.orange },

		["@type"] = { fg = palette.puce, bold = true },
		["@type.builtin"] = { fg = palette.old_gold },
		["@attribute"] = { fg = palette.amber },

		["@string"] = { fg = palette.pistachio },
		["@string.escape"] = { fg = palette.orange },
		["@string.regex"] = { fg = palette.old_gold },
		["@character"] = { fg = palette.pistachio },
		["@number"] = { fg = palette.old_gold },
		["@boolean"] = { fg = palette.orange },

		["@comment"] = { fg = palette.blue, italic = true },
		["@comment.todo"] = { fg = palette.bg, bg = palette.amber, bold = true },
	}

	-- aplicar highlights
	for group, spec in pairs(hl) do
		vim.api.nvim_set_hl(0, group, spec)
	end
	for group, spec in pairs(ts) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

return M
