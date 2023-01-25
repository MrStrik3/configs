local M = {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    lazy = false,
}

function M.config()
    require('alpha').setup(require('alpha.themes.startify').config)
end

return M
