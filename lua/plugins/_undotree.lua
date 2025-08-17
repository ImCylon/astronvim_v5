-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<A-u>"] = { "<cmd>UndotreeToggle<CR>", desc = "Find undotree" },
          ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", desc = "Find undotree" },
        },
      },
    },
  },
}
