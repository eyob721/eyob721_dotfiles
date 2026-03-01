---@diagnostic disable: undefined-doc-name
return {
  "neovim/nvim-lspconfig",
  -- Use function(_, opts) to modify the default options instead of replacing it
  opts = function(_, opts)
    -- options for vim.diagnostic.config()
    ---@type vim.diagnostic.Opts
    opts.diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        -- prefix = "icons",
      },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
          [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
        },
      },
    }
    -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the inlay hints.
    opts.inlay_hints = {
      enabled = true,
      exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
    }
    -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the code lenses.
    opts.codelens = {
      enabled = false,
    }
    -- add any global capabilities here
    opts.capabilities = {
      workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      },
    }
    -- options for vim.lsp.buf.format
    -- `bufnr` and `filter` is handled by the LazyVim formatter,
    -- but can be also overridden when specified
    opts.format = {
      formatting_options = nil,
      timeout_ms = nil,
    }
    -- LSP Server Settings
    ---@type lspconfig.options
    opts.servers = {
      -- C and C++
      -- clangd = {}, -- already installed with LazyExtras lang.clangd

      -- Bash
      bashls = {},

      -- SQL
      sqlls = {},

      -- sqls = {
      --   -- This is a SQL LSP server that comes packed with linters and formatters for the SQL language.
      --   -- DSN (dataSourceName) is the Data Source Name, which is used to connect to the database
      --   -- The format is: username:password@protocol(address)/dbname?param=value
      --   connections = {
      --     {
      --       driver = "mysql",
      --       dataSourceName = "root:@tcp(127.0.0.1:3306)/alx_book_store",
      --     },
      --   },
      -- },

      -- CSS
      cssls = {},

      -- Lua
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        -- ---@type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      },
      -- Python
      pyright = {
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                -- reportUnboundVariable = "none",
                -- reportGeneralTypeIssues = "none",
              },
              typeCheckingMode = "off", -- off, basic, strict
            },
          },
        },
      },
      pylsp = {
        -- This a Python LSP server that comes packed with linters and formatters for the Python language.
        -- You can find more information on available plugins and thier
        -- configurations from this link: https://github.com/python-lsp/python-lsp-server
        settings = {
          pylsp = {
            plugins = {
              ruff = { -- linting, code action and formatting capabilities (already have Pyright, isort and black)
                enabled = false,
              },
              pycodestyle = { -- linter for style checking
                enabled = true,
                maxLineLength = 160,
              },
              pydocstyle = { -- linter for docstring style checking
                enabled = false,
                convention = "google",
                addIgnore = {
                  "D100", -- Missing docstring in public module
                  "D415", -- First line should end with a period, question mark or exclamation point
                  "D403", -- First word of the first line should start with a Capital letter
                  "D202", -- No blank lines allowed after function docstring
                  "D205", -- 1 blank line required between summary line and description
                  "D212", -- Multi-line docstring summary should start at the first line
                },
              },
              pyflakes = { -- linter to detect various errors
                enabled = false,
              },
              mccabe = { -- linter for complexity checking
                enabled = false,
              },
            },
          },
        },
      },
    }
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    opts.setup = {
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    }
  end,
}
