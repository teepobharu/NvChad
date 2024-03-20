-- vim.o.path = vim.o.path .. './lua'
-- print(vim.o.path)
-- local script_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
-- vim.opt.runtimepath:append(',' .. script_dir)
-- print(vim.inspect(vim.api.nvim_list_runtime_paths()))
--
require "core"


-- print(script_dir .. 'init.lua')
-- package.path = package.path .. ';' .. script_dir .. 'lua'


-- print(package.path)

-- use this to load from custom place /nvim2/
-- package.path = package.path .. ';~/.config/nvim2/?.lua'

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
require "custom.mymappings"

