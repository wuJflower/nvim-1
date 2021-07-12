vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-html', 'coc-css', 'coc-clangd', 'coc-go', 'coc-lua', 'coc-vimlsp', 'coc-sh', 'coc-java', 'coc-json', 'coc-db', 'coc-prettier', 'coc-gist', 'coc-pairs', 'coc-snippets', 'coc-tabnine', 'coc-word',  'coc-markdownlint', 'coc-translator', 'coc-git' }
vim.api.nvim_command('autocmd FileType javascript,typescript,json vmap <buffer> = <Plug>(coc-format-selected)')
vim.api.nvim_command('autocmd FileType javascript,typescript,json nmap <buffer> = <Plug>(coc-format-selected)')
vim.api.nvim_command("command! -nargs=? Fold :call CocAction('fold', <f-args>)")

require'common'.set_maps({
    { 'n', '<F2>', '<Plug>(coc-rename)', {silent = true} },
    { 'n', 'gd', '<Plug>(coc-definition)', {silent = true} },
    { 'n', 'gy', '<Plug>(coc-type-definition)', {silent = true} },
    { 'n', 'gi', '<Plug>(coc-implementation)', {silent = true} },
    { 'n', 'gr', '<Plug>(coc-references)', {silent = true} },
    { 'n', 'K', ':call CocAction("doHover")<cr>', {silent = true} },
    { 'i', '<TAB>', "pumvisible() ? \"\\<C-n>\" : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", {silent = true, noremap = true, expr = true} },
    { 'i', '<s-tab>', "pumvisible() ? \"\\<c-p>\" : \"\\<s-tab>\"", {silent = true, noremap = true, expr = true} },
    { 'i', '<cr>', "pumvisible() ? \"\\<c-y>\" : \"\\<c-g>u\\<cr>\"", {silent = true, noremap = true, expr = true} },

    { 'n', '<F3>', ":silent CocRestart<cr>", {silent = true, noremap = true} },
    { 'n', '<F4>', "get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'", {silent = true, noremap = true, expr = true} },
    { 'n', '<F9>', ":CocCommand snippets.editSnippets<cr>", {silent = true, noremap = true} },

    { 'n', '<c-e>', ":CocList diagnostics<cr>", {silent = true} },
    { 'n', 'mm', "<Plug>(coc-translator-p)", {silent = true} },
    { 'v', 'mm', "<Plug>(coc-translator-pv)", {silent = true} },
    { 'n', '(', "<Plug>(coc-git-prevchunk)", {silent = true} },
    { 'n', ')', "<Plug>(coc-git-nextchunk)", {silent = true} },
    { 'n', 'C', "get(b:, 'coc_git_blame', '') ==# 'Not committed yet' ? \"<Plug>(coc-git-chunkinfo)\" : \"<Plug>(coc-git-commit)\"", {silent = true, expr = true} },
    { 'n', '<leader>g', ":call coc#config('git.addGBlameToVirtualText',  !get(g:coc_user_config, 'git.addGBlameToVirtualText', 0)) \\| call nvim_buf_clear_namespace(bufnr(), 1, 0, -1)<cr>", {silent = true} },
})
