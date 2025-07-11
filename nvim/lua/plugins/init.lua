return {
    { "saecki/crates.nvim", tag = "stable", event = "BufRead Cargo.toml" },
    { "kosayoda/nvim-lightbulb", enable = false },
    { "fedorenchik/fasm.vim", lazy = false },

    -- ### DAP PLUGINS ### --
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            handlers = {},
            automatic_installation = {},
            ensure_installed = {
                "codelldb"
            },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    { 
        "rcarriga/nvim-dap-ui", 
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = true,
        keys = {
            {
                "<leader>du",
                function () require "dapui".toggle({}) end,
                desc = "Debug: Dap UI"
            }
        }
    },
    { 
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>df",
                function () require "dap".step_over() end,
                desc = "Debug: > Step Over"
            },
            {
                "<leader>di",
                function () require "dap".step_into() end,
                desc = "Debug: ⏎ Step Into"
            },
            {
                "<leader>dg",
                function () require "dap".step_out() end,
                desc = "Debug: < Step Out"
            },
            {
                "<leader>db",
                function () require "dap".toggle_breakpoint() end,
                desc = "Debug: Toggle Breakpoint"
            },
            {
                "<leader>dB",
                function () require "dap".set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
                desc = "Debug: Set Breakpoint"
            },
            {
                "<leader>dc",
                function () require "dap".continue() end,
                desc = "Debug: Start/Continue"
            },
            {
              "<leader>dR",
              function() require "dap".run_to_cursor() end,
              desc = "Debug: Run to Cursor"
            },
            {
              "<leader>dt",
              function() require "dap".terminate() end,
              desc = "Debug: Terminate"
            },
            {
                "<leader>dr",
                function () require "dap".run_last() end,
                desc = "Debug: Run Last"
            }
        }
    },
    {
        "julianolf/nvim-dap-lldb",
        dependencies = { "mfussenegger/nvim-dap" },
    },

    -- ### OTHER PLUGINS ### --
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        keys = {
            {
                "<leader>ts",
                function () require "neotest".summary.toggle() end,
                desc = "Toggle summary"
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        opts = {
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "nvim_lsp_signature_help" },
            },
        },
    },
    { 
        "NvChad/nvterm",
        config = function ()
            require("nvterm").setup {
                terminals = {
                    type_opts = {
                        float = {
                            width = 0.72,
                            height = 0.65,
                            row = 0.2,
                            col = 0.15
                        }
                    }
                }
            }
        end
    },
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform" 
    },
    {
		"habamax/vim-godot",
		-- event = "BufEnter *.gd",
        lazy = false,
		config = function ()
			vim.cmd[[
				setlocal foldmethod=expr
				setlocal indentexpr=
			]]
		end
	},
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

    {
        "neovim/nvim-lspconfig",
        config = function()
          require "configs.lspconfig"
        end,
    },
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end,
        lazy = false
    },
    {
	    "folke/noice.nvim",
	    event = "VeryLazy",
	    dependencies = { "MunifTanjim/nui.nvim" }
    },
    {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		},
    {
        'nvimdev/lspsaga.nvim',
        event = "LspAttach",
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },
    { -- Plugin for run code
		"Zeioth/compiler.nvim",
		cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 16,
				max_height = 16,
				default_detail = 1
			},
	  	},
	},
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle win.position=right<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
    {
		"folke/snacks.nvim",
		priority = 2000,
		lazy = false,
		opts = {
			bigfile = { enabled = false },
    	    explorer = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
            dashboard = {
				enable = true, 
				preset = {
					keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
						{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
					header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
       _                                          
       \`*-.                                      
        )  _`-.                                   
       .  : `. .                                  
       : _   '  \                                 
       ; *` _.   `*-._                            
       `-.-'          `-.                         
         ;       `       `.                       
         :.       .        \                      
         . \  .   :   .-'   .                     
         '  `+.;  ;  '      :                     
         :  '  |    ;       ;-.                   
         ; '   : :`-:     _.`* ;                  
      .*' /  .*' ; .*`- +'  `*'                   
      `*-*   `*-*  `*-*'                          ]],
				},
				sections = {
					{ section = "header", pane = 2 },
					{ section = "keys", gap = 1, pane = 1, indent = 2, padding = 1 },
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2, pane = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, pane = 1 },
                }
  			},
		}
	}

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
