-- TSLint LSP plugin integration & project-level auto-fix toggle
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "typescript-tslint-plugin",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
          },
        },
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "typescript-tslint-plugin",
              },
            },
          },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = function()
      -- Create user command to enable/disable TSLint auto-formatting easily per session/project
      vim.api.nvim_create_user_command("TSLintToggle", function()
        vim.g.tslint_autoformat = not vim.g.tslint_autoformat
        local status = vim.g.tslint_autoformat and "enabled" or "disabled"
        vim.notify("TSLint auto-format " .. status, vim.log.levels.INFO, { title = "TSLint" })
      end, { desc = "Toggle TSLint auto-formatting on save" })

      -- Autocmd to execute TSLint LSP code actions on save if tslint.json exists in workspace
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("tslint_auto_fix", { clear = true }),
        pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
        callback = function(args)
          -- Skip if TSLint autoformat is explicitly disabled
          if vim.g.tslint_autoformat == false then
            return
          end

          -- Check if tslint.json exists in project root or current file directory
          local root = vim.fs.find({ "tslint.json" }, { path = args.file, upward = true })[1]
          if not root then
            return
          end

          -- Run TSLint LSP fix-all action synchronously before write if available
          local params = vim.lsp.util.make_range_params(0, "utf-8")
          params.context = {
            only = { "source.fixAll.tslint", "tslint.autoFix" },
            diagnostics = {},
          }
          vim.lsp.buf_request(args.buf, "textDocument/codeAction", params, function(err, result, ctx)
            if err or not result or vim.tbl_isempty(result) then
              return
            end
            for _, action in ipairs(result) do
              if action.edit then
                vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
              elseif action.command then
                vim.lsp.buf.execute_command(action.command)
              end
            end
          end)
        end,
      })
    end,
  },
}
