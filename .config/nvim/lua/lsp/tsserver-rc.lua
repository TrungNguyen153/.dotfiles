
local lspconfig = require("lspconfig")

local config = _G.lsp_pre_default_config()

config.on_attach = function(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false
    -- client.resolved_capabilities.document_range_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")
    print('hello from tsserver-rc')
    ts_utils.setup({
        eslint_bin = "eslint_d",
        eslint_enable_diagnostics = true,
        eslint_enable_code_actions = true,
        enable_formatting = false,
        formatter = "prettier",

        -- inlay hints
        auto_inlay_hints = true,
        inlay_hints_highlight = "Comment",
    })
    ts_utils.setup_client(client)
    _G.lsp_buf_map(bufnr, "n", ",o", ":TSLspOrganize<CR>")
    -- _G.lsp_buf_map(bufnr, "n", ",r", ":TSLspRenameFile<CR>")
    -- _G.lsp_buf_map(bufnr, "n", "fip", ":TSLspImportAll<CR>")
    -- delegate to lsp attack
    _G.lsp_on_attach(client, bufnr)
end

lspconfig.tsserver.setup(config)