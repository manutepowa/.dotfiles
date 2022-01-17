return {
  settings = {
    tailwindCSS = {
        classAttributes = { 'class' , 'className' , 'classList', 'tw', '``' },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning"
        },
        validate = true
    }
  }
}
