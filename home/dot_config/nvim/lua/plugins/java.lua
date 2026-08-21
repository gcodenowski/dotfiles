-- A complete Java environment
return {
	"nvim-java/nvim-java",
	ft = "java",
	config = function()
		require("java").setup()
		vim.lsp.enable("jdtls")

		local map = vim.keymap.set
		local java_keymaps = {
			-- Building & Running
			{ key = "<leader>jb", cmd = "<cmd>JavaBuildBuildWorkspace<cr>" },
			{ key = "<leader>jr", cmd = "<cmd>JavaRunnerRunMain<cr>" },
			{ key = "<leader>js", cmd = "<cmd>JavaRunnerStopMain<cr>" },
			{ key = "<leader>jl", cmd = "<cmd>JavaRunnerToggleLogs<cr>" },

			-- Testing
			{ key = "<leader>jt", cmd = "<cmd>JavaTestRunCurrentClass<cr>" },
			{ key = "<leader>jm", cmd = "<cmd>JavaTestRunCurrentMethod<cr>" },
			{ key = "<leader>jd", cmd = "<cmd>JavaTestDebugCurrentMethod<cr>" },
			{ key = "<leader>jR", cmd = "<cmd>JavaTestViewLastReport<cr>" },

			-- Refactoring
			{ key = "<leader>jrv", cmd = "<cmd>JavaRefactorExtractVariable<cr>" },
			{ key = "<leader>jrm", cmd = "<cmd>JavaRefactorExtractMethod<cr>" },
			{ key = "<leader>jrc", cmd = "<cmd>JavaRefactorExtractConstant<cr>" },
		}

		for _, v in ipairs(java_keymaps) do
			map("n", v.key, v.cmd, { buffer = true})
		end
	end,
}
