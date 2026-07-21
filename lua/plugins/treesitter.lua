return {
  -- Treesitter: Syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({})

      -- Install parsers asynchronously (no-op if already present)
      require("nvim-treesitter").install({
        "lua",
        "vim",
        "vimdoc",
        "rust",
        "go",
        "gomod",
        "gowork",
        "gosum",
      })

      -- Enable highlighting + indent for every filetype with a parser
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
