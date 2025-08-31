-- pull lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
require('neo-tree').setup({
  -- options go here
})

-- dùng telescope để mở file trong thư mục config nvim
vim.keymap.set("n", "<leader>fc", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config"), -- ~/.config/nvim
    prompt_title = "Neovim Config Files",
  })
end, { desc = "Find Config Files" })

