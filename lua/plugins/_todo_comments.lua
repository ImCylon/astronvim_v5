-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    opts = {
      keywords = {
        FIX = { icon = " ", color = "fix", alt = { "FIX", "FIXME", "BUG", "FIXIT", "ISSUE" } },
        WARN = { icon = " ", color = "warn", alt = { "WARNING", "XXX" } },
        HACK = { icon = " ", color = "hack" },
        NOTE = { icon = " ", color = "note", alt = { "INFO" } },
        PERF = { icon = " ", color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        TEST = { icon = "⚙️", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        TODO = { icon = "☑ ", color = "todo" },
      },
      colors = {
        warn = { "#ff9800", "DiagnosticWarn", "WarningMsg" },
        fix = { "#c62828", "DiagnosticError", "ErrorMsg" },
        hack = { "#ff00ff", "DiagnosticInfo" },
        note = { "#89dceb", "DiagnosticHint" },
        perf = { "#4caf50", "Identifier" },
        test = { "#7b1fa2", "Identifier" },
        todo = { "#ffff5f", "DiagnosticHint" },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        keywords = "wide",
        before = "",
        after = "fg",
        -- pattern = [[.*<(KEYWORDS:)\s*]],
        pattern = [[.*<(KEYWORDS:)\s*]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
    },

    config = function(_, opts)
      -- carrega o plugin com as opções
      require("todo-comments").setup(opts)
      -- função que aplica o highlight desejado
      local apply_todohighlight = function()
        vim.api.nvim_set_hl(0, "TodoBgWarn", { fg = "#100000", bg = "#ff9800", bold = true }) -- WARN:
        vim.api.nvim_set_hl(0, "TodoBgFix", { fg = "#100000", bg = "#c62828", bold = true }) -- FIX:
        vim.api.nvim_set_hl(0, "TodoBgHack", { fg = "#100000", bg = "#ff00ff", bold = true }) -- HACK:
        vim.api.nvim_set_hl(0, "TodoBgNote", { fg = "#100000", bg = "#89dceb", bold = true }) -- NOTE:
        vim.api.nvim_set_hl(0, "TodoBgPerf", { fg = "#100000", bg = "#4caf50", bold = true }) -- PERF:
        vim.api.nvim_set_hl(0, "TodoBgTest", { fg = "#100000", bg = "#7b1fa2", bold = true }) -- TEST:
        vim.api.nvim_set_hl(0, "TodoBgTodo", { fg = "#100000", bg = "#ffff5f", bold = true }) -- TODO:
      end

      -- aplica agora e reaplica em eventos que podem sobrescrever highlights
      apply_todohighlight()
      vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
        callback = apply_todohighlight,
      })
    end,
  },
}
