return {
  "Bryley/neoai.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "NeoAI",
    "NeoAIOpen",
    "NeoAIClose",
    "NeoAIToggle",
    "NeoAIContext",
    "NeoAIContextOpen",
    "NeoAIContextClose",
    "NeoAIInject",
    "NeoAIInjectCode",
    "NeoAIInjectContext",
    "NeoAIInjectContextCode",
    "NeoAIShortcut",
  },
  keys = {
    { "<leader>ai", "<cmd>NeoAI<cr>", noremap = true, silent = true },
    { "<leader>pc", "<cmd>put c<cr>", noremap = true, silent = true },
    { "<leader>pg", "<cmd>put g<cr>", noremap = true, silent = true },
  },
  config = function()
    require('neoai').setup {
      ui = {
        output_popup_text = "NeoAI",
        input_popup_text = "Prompt",
        width = 40,             -- As percentage eg. 30%
        output_popup_height = 80, -- As percentage eg. 80%
      },
      models = {
        {
          name = "openai",
          model = "gpt-3.5-turbo"
        },
      },
      register_output = {
        ["g"] = function(output)
          return output
        end,
        ["c"] = require("neoai.utils").extract_code_snippets,
      },
      mappings = {
        ["select_up"] = "<C-k>",
        ["select_down"] = "<C-j>",
      },
      inject = {
        cutoff_width = 75,
      },
      prompts = {
        context_prompt = function(context)
          return "Hey, I'd like to provide some context for future "
              .. "messages. Here is the code/text that I want to refer "
              .. "to in our upcoming conversations:\n\n"
              .. context
        end,
      },
      open_api_key_env = "OPENAI_API_KEY",
    }
  end
}
