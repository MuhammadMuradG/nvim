require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'bash',
        'comment',
        'c',
        'cpp',
        'css',
        'csv',
        'dart',
        'html',
        'json',
        'lua',
        'python'
    },

    auto_install = false,

    highlight = {
        enable = true
    },

    indent = {
        enable = true
    },
}
