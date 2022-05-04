-- Just an example, supposed to be placed in /lua/custom/

local M = {}

M.ui = {
   theme = "catppuccin",
}

local userPlugins = require "custom.plugins"

M.plugins = {
   user = userPlugins
}

return M
