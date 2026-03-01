return {
  "stevearc/conform.nvim",
  opts = function()
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        python = { "isort", "black" },
        c = { "clang_format" },
        sql = { "sql_formatter" },
        javascript = { "prettier" },
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- # Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        --
        -- # Example of using shfmt with extra args
        -- shfmt = {
        --   prepend_args = { "-i", "2", "-ci" },
        -- },
        --
        black = {
          prepend_args = { "--line-length=79" },
        },
        clang_format = {
          -- Below line is only left here for example
          -- prepend_args = { "--style=file:" .. vim.fn.expand("$HOME/.config/nvim/.clang-format") },
        },
        sql_formatter = {
          -- More info from: https://github.com/sql-formatter-org/sql-formatter
          prepend_args = {
            vim.fn.expand("--config=$HOME/.config/nvim/.sql-format.json"),
          },
        },
      },
    }
    return opts
  end,
}
