require("options").setup()
require("lazy-setup").setup()
require("keymaps").setup()
require("autocommands").setup()
local ok, extra_config = pcall(require, "extra-config")
if ok then extra_config.setup() end
