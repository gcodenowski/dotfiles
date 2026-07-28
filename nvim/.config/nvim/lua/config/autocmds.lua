--[[
   ░███                  ░██                                                 ░██
  ░██░██                 ░██                                                 ░██
 ░██  ░██  ░██    ░██ ░████████  ░███████   ░███████  ░█████████████   ░████████  ░███████
░█████████ ░██    ░██    ░██    ░██    ░██ ░██    ░██ ░██   ░██   ░██ ░██    ░██ ░██
░██    ░██ ░██    ░██    ░██    ░██    ░██ ░██        ░██   ░██   ░██ ░██    ░██  ░███████
░██    ░██ ░██   ░███    ░██    ░██    ░██ ░██    ░██ ░██   ░██   ░██ ░██   ░███        ░██
░██    ░██  ░█████░██     ░████  ░███████   ░███████  ░██   ░██   ░██  ░█████░██  ░███████
See ':help lua-guide-autocommands'
]]

--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {
		clear = true,
	}),
	callback = function()
		vim.hl.on_yank({ higroup = "YankFlash", timeout = 150 })
	end,
})

-- Clear all trailing whitespace on save
-- Skips markdown filetype
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove trailing whitespace on save",
	group = vim.api.nvim_create_augroup("kickstart-trim-whitespace", {
		clear = true,
	}),
	callback = function()
		local ignored_filetypes = { markdown = true }
		if ignored_filetypes[vim.bo.filetype] then
			return
		end
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})
