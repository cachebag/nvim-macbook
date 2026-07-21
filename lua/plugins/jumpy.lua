return {
  {
    "cachebag/jumpy",
    config = function()
      require("jumpy").setup({
        provider = "claude_code",
      })
    end,
  },
}
