require("options").setup()
require("keymaps").setup()
require("autocommands").setup()
require("lazy-setup").setup()
local ok, extra_config = pcall(require, "extra-config")
if ok then extra_config.setup() end
