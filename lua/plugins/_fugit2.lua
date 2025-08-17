-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "SuperBo/fugit2.nvim",
  cmd = { "Fugit2", "Fugit2Graph" },
  specs = {
    { import = "astrocommunity.git.diffview-nvim" },
    { import = "astrocommunity.git.nvim-tinygit" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<leader>gf"] = { "<Cmd>Fugit2<CR>", desc = "Fugit2" },
            ["<leader>gB"] = { "<Cmd>Fugit2Blame<CR>", desc = "Fugit2Blame" },
            ["<leader>gg"] = { "<Cmd>Fugit2Graph<CR>", desc = "Fugit2Graph" },
          },
        },
      },
    },
  },
  opts = {},
}
