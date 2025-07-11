require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- setup other keys
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kk", "<ESC>")
map("n", "<S-u>", "<cmd>redo<CR>")

map("n", "w", "<cmd>Lspsaga code_action<CR>")

-- setup terminal
vim.keymap.del("n", "<A-i>")
map(
    {"n", "t"}, "<A-i>", 
    function() 
        local opts = {
            width = 0.72,
            height = 0.65,
            row = 0.2,
            col = 0.15
        }

        require("nvchad.term").toggle { pos="float", id="my_term", float_opts=opts }
    end, { noremap = true, silent = true }
)

-- setup which-key
require("which-key").add({
    {"<leader>rr", "<cmd>CompilerOpen<CR>", desc = "Run code"},
    {"<leader>q", "<cmd>q<CR>", desc = "Quit"},
    {"<leader>gl", "<cmd>lua require(\"snacks\").lazygit.open()<CR>", desc = "Open Lazygit"},
    {"<leader>s", "<cmd>bdelete<CR>", desc = "Close buffer"},
})

