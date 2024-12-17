-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  { "rafamadriz/friendly-snippets" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  { "alexghergh/nvim-tmux-navigation" }
}
