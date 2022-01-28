local util = require "lspconfig".util
return {
    -- Mirar porque en los jsx no funciona el autoimport
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")
}

-- Si no funciona esto del root_dir para el completado autoimport
-- Usarlo esta conf en un jsconfig o tsconfig
-- {
--   "compilerOptions": {
--     "rootDir": "./src"
--   },
--   "exclude": [
--     "./node_modules"
--   ]
-- }
