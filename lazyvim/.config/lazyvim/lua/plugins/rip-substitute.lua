return {
  "chrisgrieser/nvim-rip-substitute",
  enabled = false,
  cmd = "RipSubstitute",
  keys = {
    {
      "<leader>r",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = "rip substitute",
    },
  },
}
