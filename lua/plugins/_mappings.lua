-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  -- NOTE: General Mappings
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      -- Adiciona novos mappings ou ajusta os existentes para astrocore
      opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
        n = { -- NOTE: normal mode
          -- Save and Quit
          ["<leader>ww"] = { ":w<CR>", desc = "Salvar arquivo" },
          ["<leader>wa"] = { ":wall<CR>", desc = "Salvar todos arquivos" },
          ["<leader>wqa"] = { ":wqall<CR>", desc = "Salvar e fechar todos arquivos" },
          ["<leader>wq"] = { ":wq<CR>", desc = "Salvar e fechar todos arquivos" },
          ["<leader>qq"] = { ":q<CR>", desc = "Fechar arquivo" },
          ["<leader>qa"] = { ":qall<CR>", desc = "Fechar todos arquivos" },

          -- Yank/Copy lines
          ["<leader>y"] = { '"+y', desc = "Yank..." },
          ["<leader>yy"] = { '"+y', desc = "Copia a linha" },
          ["<leader>Y"] = { "<CMD>silent! %y+<CR>", desc = "Copia todo buffer" },

          -- Move lines
          ["<A-Down>"] = { ":m .+1<CR>", desc = "Down line" },
          ["<A-Up>"] = { ":m .-2<CR>", desc = "Up line" },
          ["<A-k>"] = { ":m .-2<CR>", desc = "Up line" },
          ["<A-j>"] = { ":m .+1<CR>", desc = "Down line" },

          -- General
          ["<leader>ts"] = { ":silent !tmux new-window -n tms 'tms'<CR>", desc = "Abre diretorio de projetos" },
        },
        i = { -- NOTE: modo insert
          ["jk"] = { "<Esc>", desc = "Sair do modo insert" },
          ["kj"] = { "<Esc>", desc = "Sair do modo insert" },
        },
        v = { -- NOTE: modo visual
          ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Down lines block" },
          ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Up lines block" },
          ["<leader>y"] = { '"+y', desc = "Yank..." },
          ["<leader>yy"] = { '"+y', desc = "Copia a linha" },
          ["<leader>Y"] = { '<ESC>ggVG"+y', desc = "Copia todo buffer" },
        },
      })
      return opts
    end,
  },

  -- NOTE: LSP Mappings
  {
    "AstroNvim/astrolsp",
    opts = {
      mappings = {
        n = {
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
          ["<leader>ll"] = {
            function() vim.lsp.codelens.run() end,
            desc = "Executar CodeLens (Run/Test) (LSP buffer)",
          },
          ["<leader>lL"] = {
            function() vim.lsp.codelens.refresh() end,
            desc = "Atualizar CodeLens (LSP buffer)",
          },
        },
      },
    },
  },
}
