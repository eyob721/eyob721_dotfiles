return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["lua"] = { "stylua" },
      ["sh"] = { "shfmt" },
      ["c"] = { "clang_format" },
      ["python"] = { "isort", "black" },
      -- NOTE: For JavaScript and TypeScript files the tsserver LSP formatter
      -- is enabled, in addition with eslint fix command
      --
      -- ["javascript"] = { "prettier" },
      -- ["javascriptreact"] = { "prettier" },
      -- ["typescript"] = { "prettier" },
      -- ["typescriptreact"] = { "prettier" },
      --
      ["vue"] = { "prettier" },
      ["css"] = { "prettier" },
      ["scss"] = { "prettier" },
      ["less"] = { "prettier" },
      ["html"] = { "prettier" },
      ["json"] = { "prettier" },
      ["jsonc"] = { "prettier" },
      ["yaml"] = { "prettier" },
      ["markdown"] = { "mdformat" },
      ["markdown.mdx"] = { "mdformat" },
      ["graphql"] = { "prettier" },
      ["handlebars"] = { "prettier" },
      ["sql"] = { "sql_formatter" },
      ["puppet"] = { "puppet-lint" },
      ["*"] = { "trim_whitespace", "trim_newlines" },
      ["_"] = { "trim_whitespace", "trim_newlines" },
    },
    -- The options you set here will be merged with the builtin formatters.
    -- You can also define any custom formatters here.
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
      clang_format = {},
      black = {
        prepend_args = { "--line-length=79" },
      },
      prettier = {
        prepend_args = {
          "--tab-width=2", -- default: 2
          "--use-tabs=false", -- default: false
          "--print-width=80", -- default: 80
          "--no-semi=true", -- default: true
          "--single-quote=true", -- default: false
          "--trailing-comma=none", -- default: all
        },
      },
      sql_formatter = {
        prepend_args = {
          vim.fn.expand("--config=$HOME/.config/nvim/.sql-format.json"),
        },
      },
    },
  },
}
