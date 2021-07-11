-- vim-lines
vim.g.line_powerline_enable = 1
vim.g.line_nerdfont_enable = 1
vim.g.line_unnamed_filename='~'
vim.g.line_statusline_getters = {'v:lua.GitInfo', 'v:lua.CocErrCount', 'v:lua.GetFt'}
function GitInfo()
    local branch = vim.g.coc_git_status or ''
    local diff = vim.b.coc_git_status or ''
    return (string.len(branch) > 0 and string.format(" %s ", branch) or " none ")
        .. (string.len(diff) > 0 and string.format('%s ', vim.fn.trim(diff)) or '')
end
function CocErrCount()
    local coc_diagnostic_info = vim.b.coc_diagnostic_info or { error = 0 }
    return string.format(' E%d ', coc_diagnostic_info.error)
end
function GetFt()
    local ft = vim.api.nvim_eval('$ft')
    return string.format(' %s ', string.len(ft) > 0 and ft or '~')
end

-- vim-comment
vim.g.vim_line_comments = { vim= '"', vimrc= '"', js= '//', ts= '//', java= '//', class= '//', c= '//', h= '//', go= '//', lua= '--' }
vim.g.vim_chunk_comments = { js= {'/**', ' *', ' */'}, ts= {'/**', ' *', ' */'}, sh= {':<<!', '', '!'}, md= {'```', ' ', '```'} }
require'common'.set_maps({
    { 'n', '??', ':NToggleComment<cr>', {silent = true, noremap = true}},
    { 'v', '/', ':<c-u>VToggleComment<cr>', {silent = true, noremap = true}},
    { 'v', '?', ':<c-u>CToggleComment<cr>', {silent = true, noremap = true}},
})

-- vim-hLchunk
vim.api.nvim_command("autocmd CursorMoved,CursorMovedI,TextChanged,TextChangedI,TextChangedP *.ts,*.js,*.go,*.c,*.json call HlChunk()")
