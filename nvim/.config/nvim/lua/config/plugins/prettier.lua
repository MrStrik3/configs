local M = {
  'MunifTanjim/prettier.nvim'
}

function M.config()
  require("prettier").setup({
      bin = 'prettier', -- or `prettierd`
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
    })
end

return M
