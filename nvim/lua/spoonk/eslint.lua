local eslint = require("eslint")


eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = false,
    apply_on_save = {
      enable = false,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})
