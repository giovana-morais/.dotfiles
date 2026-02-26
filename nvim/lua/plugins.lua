local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        --nvimtree
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup { }

            -- change toggle to ,n as i had before
            vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })

        end,
    },
    {
        -- colorscheme
        "EdenEast/nightfox.nvim"
    },
    {
        -- LSP
        "mason-org/mason.nvim", opts = {}
    },
    {
        -- autocomplete
        "saghen/blink.cmp",
        dependencies = {"rafamadriz/friendly-snippets"},
        version = "*",
        opts = {
            keymap = {
                -- how to choose the completion
                preset = "enter",
                -- scroll completion options
                ["<Up>"] = {"select_next", "fallback"},
                ["<Down>"] = {"select_prev", "fallback"},
                ["<Tab>"] = {"select_next", "fallback"},
                ["<STab>"] = {"select_prev", "fallback"},
                -- scroll docummentation
                ["<C-b>"] = {"scroll_documentation_up", "fallback"},
                ["<C-f>"] = {"scroll_documentation_down", "fallback"},
                -- show/hide signature
                ["<C-k>"] = {"show_signature", "hide_signature", "fallback" },
				-- trigger command for completion
				["<C-Space>"] = { "show", "fallback" },
            },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = {
                keyword = { range = "prefix" },
				trigger = {
					show_on_trigger_character = true,
					show_on_keyword = false,           -- Don't trigger on normal typing
					show_on_trigger_character = true,   -- Trigger on LSP characters
					show_on_insert_on_trigger_character = true,
					show_on_blocked_trigger_characters = {
						" ", "\n", "\t", "'", '"', "(", "[", "{",
						-- Add language-specific blocks
						["lua"] = { "=" },  -- Block after = in Lua
						["python"] = { ":" }, -- Block after : in Python (for type hints)
					},
				},
                -- show docs automatically
                documentation = {auto_show = true},
            },
            sources = {
                default = {"lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            signature = {enabled = true},
        },
        opts_extended = { "sources.default" }
    }
})
