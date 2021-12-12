let g:telescope_cache_results = 1
let g:telescope_prime_fuzzy_find  = 1

nnoremap <leader>fg :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>

nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').oldfiles()<CR>

nnoremap <leader>'' :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fm :lua require('telescope.builtin').man_pages()<CR>

nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pr :lua require('telescope.builtin').treesitter()<CR>

nnoremap <leader>bb :lua require('telescope.builtin').file_browser()<CR>

" nnoremap <leader>gs :lua require('telescope.builtin').git_status()<CR>

" nnoremap <leader>rc :lua require('alpha.telescope').search_config()<CR>

" nnoremap <leader>vrr :lua require('telescope.builtin').lsp_references()<CR>

" nnoremap <leader>vs :lua require('telescope.builtin').lsp_document_symbols()<CR>
" nnoremap <leader>ve :lua require('telescope.builtin').lsp_document_diagnostics()<CR>

nnoremap <leader>fp :lua require('alpha.telescope').project_find()<CR>
