-- plugins/telescope.lua:
return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function ()
		require("telescope").setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<C-e>', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git files' })
		vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
	end

}
