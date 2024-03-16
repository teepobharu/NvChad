-- improt inside plugins config

vim.g.startify_custom_header = {
    '       _  __     _         __  ___         __     ___ ',
    '      / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
    '     /    / |/ / /  ` \\  / /|_/ / _ `/ __/ _ \\  / __/ ',
    '    /_/|_/|___/_/_/_/_/ /_/  /_/\\_,_/\\__/_//_/ /____/ ',
}

vim.g.startify_session_dir = '~/.config/nvim/session'

vim.g.startify_lists = {
    { type = 'files', header = {'   Files'} },
    { type = 'dir', header = {'   Current Directory ' .. vim.fn.getcwd()} },
    { type = 'sessions', header = {'   Sessions'} },
    { type = 'bookmarks', header = {'   Bookmarks'} },
}

vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1

vim.g.webdevicons_enable_startify = 1

function StartifyEntryFormat()
    return vim.fn.WebDevIconsGetFileTypeSymbol(vim.fn.absolute_path()) .. ' ' .. vim.fn.entry_path()
end

vim.g.startify_bookmarks = {
    { c = '~/.config' },
    { i = '~/.config/nvimChad/nvim/init.lua' },
    { z = '~/.zshrc' },
    { t = '~/.tmux.conf' },
    { b = '~/.bash_profile' },
    { a = '~/.bash_aliases' },
    { K = '~/.config/karabiner/karabiner.json' },
    -- { r = '~/.config/karabiner/assets/complex_modifications/capslock.json' },
    { s = '~/.slate' },
    { ['.'] = '~/.config/nvimChad/nvim/plug-config/start-screen.vim' },
    { p = '~/.config/nvimChad/nvim/vim-plug/plugins.vim' },
    { w = '~/.config/nvim/keys/which-key.vim' },
    { G = '~/AgodaGit' },
    { ms = '~/AgodaGit/fe/mspa/Agoda.Mobile.Client/package.json' },
}

vim.g.startify_enable_special = 0

