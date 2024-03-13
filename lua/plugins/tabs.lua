return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	init = function()
		vim.keymap.set("n", "bs", vim.cmd.BufferLineCloseOthers, { desc = "[b]uffer [s]ingle" })
		vim.keymap.set("n", "bt", vim.cmd.BufferLinePick, { desc = "[b]uffer [t]arget" })
		--vim.keymap.set("n", "<leader>bcr", vim.cmd.BufferLineCloseRight)
		--vim.keymap.set("n", "<leader>bcl", vim.cmd.BufferLineCloseLeft)
		vim.keymap.set("n", "<leader>bct", vim.cmd.BufferLinePickClose, { desc = "[b]uffer [close] [target]" })
		vim.keymap.set("n", "bl", vim.cmd.BufferLineCycleNext, { desc = "[b]uffer right [l] -> " })
		vim.keymap.set("n", "bh", vim.cmd.BufferLineCyclePrev, { desc = "[b]uffer left  [h] <- " })
		vim.keymap.set("n", "<leader>bl", vim.cmd.BufferLineMoveNext, { desc = "[b]uffer move to right [l] -> " })
		vim.keymap.set("n", "<leader>bh", vim.cmd.BufferLineMovePrev, { desc = "[b]uffer move to left  [h] <- " })
	end,
	config = function()
		local bufferline = require("bufferline")
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "buffers",
				style_preset = bufferline.style_preset.minimal,
				themable = true,
				numbers = "ordinal",
				close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "underline", -- 'icon' | 'underline' | 'none',
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer", -- "File Explorer" | function ,
						text_align = "center", -- "left" | "center" | "right"
						separator = true,
					},
				},
				padded_slant = true,
				color_icons = true, -- whether or not to add the filetype icon highlights
				get_element_icon = function(element)
					-- element consists of {filetype: string, path: string, extension: string, directory: string}
					-- This can be used to change how bufferline fetches the icon
					-- for an element e.g. a buffer or a tab.
					-- e.g.
					local icon, hl =
						require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
					return icon, hl
					-- or
					--local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
					--return custom_map[element.filetype]
				end,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
				separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
				show_buffer_close_icons = true, -- true | false,
				show_close_icon = true, --true | false,
				show_tab_indicators = true, --true | false,
			},
		})
	end,
}
