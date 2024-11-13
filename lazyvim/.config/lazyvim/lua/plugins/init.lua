-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  { 'L3MON4D3/LuaSnip' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  { "alexghergh/nvim-tmux-navigation" }
}
