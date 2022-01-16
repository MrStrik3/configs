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

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "pyright",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = nvimlspinstaller.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end



