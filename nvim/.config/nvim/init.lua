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
vim.o.showmode = true,

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


--colorscheme
vim.cmd[[colorscheme solarized-osaka]]

require("solarized-osaka").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

--noice plugins
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})


--dashboard
require("dashboard").setup ({
      theme = "doom",
      config = {
        header = {
'██╗      █████╗ ██╗   ██╗ ██████╗ ██╗  ██╗',
'██║     ██╔══██╗██║   ██║██╔════╝ ██║  ██║',
'██║     ███████║██║   ██║██║  ███╗███████║',
'██║     ██╔══██║██║   ██║██║   ██║██╔══██║',
'███████╗██║  ██║╚██████╔╝╚██████╔╝██║  ██║',
'╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝',
        },
        center = {
          { icon = "  ",     desc = "New File",          action = "enew",                      key = "n" },
          { icon = "  ",     desc = "Find File",         action = "Telescope find_files",      key = "f" },
          { icon = "  ",     desc = "Recent Files",      action = "Telescope oldfiles",        key = "r" },
          { icon = "  ",     desc = "Quit",              action = "qa",                        key = "q" },
          { icon = "   ",  desc = "config file",       action = "Telescope find_files cwd=~/.config/nvim",     key = "c"},
        },
        footer = { "⚡hehe ⚡" },
      },
    })


--cliboard
vim.o.clipboard = "unnamedplus"


