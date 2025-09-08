return {
  { "folke/lazy.nvim" },
  { "mason-org/mason.nvim" },
  { "LazyVim/LazyVim" },
  { "benomahony/uv.nvim", opts = {
    picker_integration = true,
  } },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "just",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
