return {
  ---------------------------------------------------------------------------
  -- LazyVim uses blink.cmp for completion.
  ---------------------------------------------------------------------------
  {
    "saghen/blink.cmp",
    dependencies = { "moyiz/blink-emoji.nvim" },
    opts = {
      sources = {
        default = { "emoji" },
        providers = {
          emoji = { name = "Emoji", module = "blink-emoji" },
        },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Treesitter: ensure parsers
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Explicitly register the parser directory in runtimepath, including on Neovim 0.12.
      opts.install_dir = vim.fn.stdpath("data") .. "/site"
      -- Current Treesitter uses the JSON parser for JSON with comments.
      opts.ensure_installed = vim.tbl_filter(function(lang)
        return lang ~= "jsonc"
      end, opts.ensure_installed or {})
      vim.treesitter.language.register("json", "jsonc")
    end,
  },

  ---------------------------------------------------------------------------
  -- Mason tools
  ---------------------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "flake8" },
        sh = { "shellcheck" },
      },
    },
  },
}
