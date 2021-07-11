local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_icons = {
    git= {
        unstaged= "~",
        staged= "+",
        unmerged= "!",
        renamed= "+",
        untracked= "?",
        deleted= "-",
        ignored= "…"
    }
}
vim.g.nvim_tree_bindings = {
    { key = {"<Right>"}, cb = tree_cb("edit") },
    { key = {"<C-]>"},   cb = tree_cb("cd") },
    { key = "<BS>",      cb = tree_cb("dir_up") },
    { key = "<Left>",    cb = tree_cb("close_node") },
}

require'common'.set_maps({ {'n', 'T', ':NvimTreeToggle<CR>', {noremap = true}} })
require'common'.set_highlights({NvimTreeFolderIcon = {fg=32}})
