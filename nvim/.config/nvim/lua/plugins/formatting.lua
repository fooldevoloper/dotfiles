return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.default_format_opts = opts.default_format_opts or {}
      -- Never run default LSP formatting (prevents Prettier/ESLint/LSP side-effects)
      opts.default_format_opts.lsp_format = "never"

      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Configure TS/JS filetypes to use tslint and trim_whitespace
      local ts_formatters = { "tslint", "trim_whitespace" }
      opts.formatters_by_ft["javascript"] = ts_formatters
      opts.formatters_by_ft["javascriptreact"] = ts_formatters
      opts.formatters_by_ft["typescript"] = ts_formatters
      opts.formatters_by_ft["typescriptreact"] = ts_formatters

      -- Disable auto-formatting on save for JSON and JSONC (matching VS Code settings.json)
      opts.formatters_by_ft["json"] = {}
      opts.formatters_by_ft["jsonc"] = {}

      opts.formatters = opts.formatters or {}
      opts.formatters.tslint = {
        command = "tslint",
        args = { "--fix", "$FILENAME" },
        stdin = false,
        -- Detect tslint.json in project root
        cwd = require("conform.util").root_file({ "tslint.json" }),
        -- require_cwd = true ensures TSLint formatter only runs if tslint.json exists in the project
        require_cwd = true,
        condition = function(self, ctx)
          -- Respect vim.g.tslint_autoformat toggle (can be overridden per project via .neoconf.json)
          if vim.g.tslint_autoformat == false then
            return false
          end
          return true
        end,
      }
    end,
  },
}
