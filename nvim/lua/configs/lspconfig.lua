require("nvchad.configs.lspconfig").defaults()

local servers = { "rust-analyzer", "pyright", "asm-lsp" }
vim.lsp.enable(servers)

-- asm-lsp
vim.lsp.config("asm-lsp", {
    cmd = {"/home/user/.local/share/nvim/mason/bin/asm-lsp"},
    filetypes = {"asm"},
    root_markers = {"Makefile"},
})

-- gdshader
function gdshader()
    vim.lsp.start {
        name = "gdshader-lsp",
        cmd = {
            "/home/user/bin/gdshader-lsp",
        },
        capabilities = vim.lsp.protocol.make_client_capabilities()
    }
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = "gdshader",
    callback = gdshader
})

-- gdscript
function gdscript()
  vim.lsp.start ({
    name = "gdscript",
    cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
    capabilities = vim.lsp.protocol.make_client_capabilities()
  })
end

require("lspconfig")["gdscript"].setup({
    name = "godot",
    cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = "gd",
	callback =
		function ()
    		vim.cmd[[
				setlocal foldmethod=expr
				setlocal indentexpr=
			]]
		end
})

-- read :h vim.lsp.config for changing options of lsp servers 
