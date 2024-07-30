return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.nixpkgs_fmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.xmllint,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
