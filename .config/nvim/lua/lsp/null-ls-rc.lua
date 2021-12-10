

local lspconfig = require("lspconfig")

require("null-ls").config({})
lspconfig["null-ls"].setup({ on_attach = _G.lsp_on_attach })