require('mason').setup({
  ui = {
    border = 'rounded'
  }
})

require("mason-lspconfig").setup {
  ensure_installed = {
    -- "prettier",
    "eslint", "tsserver", "graphql" },
}

-- lsp.on_attach(function(client, bufnr)
--   lsp.default_keymaps({ buffer = bufnr })
--
--   local opts = { buffer = buffnr, remap = false }
--
--   lsp.buffer_autoformat()
--
--   vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end, opts)
-- end)

-- require('lspconfig').lua_ls.setup({
--   settings = {
--     ["runtime.version"] = "LuaJIT",
--     ["diagnostic.globals"] = {
--       "ngx",
--     },
--     ["workace.libary"] = {
--       "${3rd}/OpenResty/library",
--     },
--   },
-- })
--

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<Leader>f", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })

    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = "[lsp] format on save",
    })
  end

  if client.supports_method("textDocument/rangeFormatting") then
    vim.keymap.set("x", "<Leader>f", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })
  end
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip',  keyword_length = 2 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})
