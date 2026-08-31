-- Opencode integration for neovim
return {
	"nickjvandyke/opencode.nvim",
	version = "*", -- Latest stable release
	dependencies = {
		{
			-- `snacks.nvim` integration is recommended, but optional
			---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
			"folke/snacks.nvim",
			optional = true,
			opts = {
				input = {}, -- Enhances `ask()`
				picker = { -- Enhances `select()`
					actions = {
						opencode_send = function(...)
							return require("opencode").snacks_picker_send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
							},
						},
					},
				},
			},
		},
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any; goto definition on the type or field for details
		}

		vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

		-- Recommended/example keymaps
		vim.keymap.set({ "n", "x" }, "<leader>at", function()
			require("opencode").ask("@this: ")
		end, { desc = "Ask opencode…" })

		vim.keymap.set({ "n", "x" }, "<leader>av", function()
			require("opencode").ask("@visible: ")
		end, { desc = "Visible Text" })

		vim.keymap.set({ "n", "x" }, "<leader>ag", function()
			require("opencode").ask("@diff: ")
		end, { desc = "Git Diff" })

		vim.keymap.set({ "n", "x" }, "<leader>ad", function()
			require("opencode").ask("@diagnostics: ")
		end, { desc = "Diagnostics" })

		vim.keymap.set({ "n", "x" }, "<leader>as", function()
			require("opencode").command("prompt.submit")
		end, { desc = "Submit Prompt" })

		vim.keymap.set({ "n", "x" }, "<leader>ac", function()
			require("opencode").command("prompt.clear")
		end, { desc = "Clear Prompt" })

		vim.keymap.set({ "n", "x" }, "<leader>ase", function()
			require("opencode").select()
		end, { desc = "Select opencode…" })

		vim.keymap.set("n", "<leader>ai", function()
			require("opencode").command("session.interrupt")
			require("opencode").command("session.interrupt")
			-- has to be sent twice to confirm
		end, { desc = "Interrupt opencode" })

		vim.keymap.set("n", "<leader>ans", function()
			require("opencode").command("session.new")
		end, { desc = "Start a new session" })

		vim.keymap.set("n", "<leader>af", function()
			require("opencode").operator("@fix")
		end, { desc = "Fix this" })

		vim.keymap.set("n", "<leader>ao", function()
			require("opencode").operator("@optimize")
		end, { desc = "Optimize this" })

		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add range to opencode", expr = true })

		vim.keymap.set("n", "goo", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add line to opencode", expr = true })

		-- These don't work for now
		vim.keymap.set("n", "<C>k", function()
			require("opencode").command("session.page.up")
		end, { desc = "Scroll opencode up" })

		vim.keymap.set("n", "<C>j", function()
			require("opencode").command("session.page.down")
		end, { desc = "Scroll opencode down" })
	end,
}
