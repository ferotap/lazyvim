-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>cD', vim.lsp.buf.declaration, { desc='(LSP) Goto declaration' })
    vim.keymap.set('n', '<space>cd', vim.lsp.buf.definition, { desc='(LSP) Goto definition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,  { desc='(LSP) Hover help' })
    vim.keymap.set('n', '<space>ci', vim.lsp.buf.implementation, { desc='(LSP) Goto implementation' })
    vim.keymap.set('n', '<space>cs', vim.lsp.buf.signature_help, { desc='(LSP) Signature help' })
    vim.keymap.set('n', '<space>cwa', vim.lsp.buf.add_workspace_folder, { desc='(LSP) Add workspace folder' })
    vim.keymap.set('n', '<space>cwr', vim.lsp.buf.remove_workspace_folder, { desc='(LSP) Remove workspace folder' })
    vim.keymap.set('n', '<space>cwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc='(LSP) Remove workspace folder' })
    vim.keymap.set('n', '<space>ct', vim.lsp.buf.type_definition, { desc='(LSP) Type definition' })
    vim.keymap.set('n', '<space>cr', vim.lsp.buf.rename, { desc='(LSP) Rename' })
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc='(LSP) Code action' })
    vim.keymap.set('n', '<space>cr', vim.lsp.buf.references, { desc='(LSP) Show references' })
    vim.keymap.set('n', '<space>cf', function()
      vim.lsp.buf.format { async = true }
    end, { desc='(LSP) Format' })
  end,
})
