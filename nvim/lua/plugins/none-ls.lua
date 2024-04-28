return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Nix
				null_ls.builtins.formatting.nixpkgs_fmt,

				-- Typescript
				--				null_ls.builtins.diagnostics.eslint_d,
				--				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
