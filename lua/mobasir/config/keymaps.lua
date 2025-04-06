local keymaps = vim.keymap

keymaps.set("n", "<leader>l", "<cmd>:Lazy<CR>")
keymaps.set("n", "<leader>*", "<cmd>:wqa<CR>")

keymaps.set({ "n", "v" }, "<leader>y", [["+y]])
keymaps.set("n", "<leader>Y", [["+Y]])

keymaps.set("n", "<C-s>", "<cmd>:w<CR>")

keymaps.set("v", "<C-k>", ":m '>+1<CR>gv=gv")
keymaps.set("v", "<C-j>", ":m '>-2<CR>gv=gv")

keymaps.set("n", "J", "mzJ`z")
keymaps.set("n", "<C-d>", "<C-d>zz")
keymaps.set("n", "<C-u>", "<C-u>zz")

keymaps.set("n", "<leader><leader>s", "<cmd>source %<CR>")
keymaps.set("x", "<leader>p", '"_d')

keymaps.set("n", "<C-e>", "<cmd>Oil<CR>", { noremap = true, silent = true })

keymaps.set("n", "<leader>e", "<cmd>:Ex<CR>", { noremap = true, silent = true })

keymaps.set("n", "<leader>F", "%", { noremap = true, silent = true })

keymaps.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { noremap = true, silent = true })
keymaps.set("n", "<leader>dus", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end, { noremap = true, silent = true })

keymaps.set("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end, { noremap = true, silent = true })

keymaps.set("n", "<leader>dgl", function()
	require("dap-go").debug_last()
end, { noremap = true, silent = true })

