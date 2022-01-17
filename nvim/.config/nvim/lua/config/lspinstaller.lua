local nvimlspinstaller = require("nvim-lsp-installer")

nvimlspinstaller.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

