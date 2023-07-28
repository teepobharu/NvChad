---@type MappingsTable
local M = {}

M.general = {
  i = { 
    [ "<A-j>" ] = { "<esc><cmd>m .+1<cr>==gi", "Move down" },
    [ "<A-k>" ] = { "<esc><cmd>m .-2<cr>==gi", "Move up" },
  },
  n = {
    [ "<Up>" ] =  { ":resize -10<CR>", opts = { silent = true }},
    [ "<Down>" ] =  { ":resize +10<CR>", opts = { silent = true }},
    [ "<Left>" ] =  { ":vertical resize -10<CR>", opts = { silent = true }},
    [ "<Right>" ] =  { ":vertical resize +10<CR>", opts = { silent = true }},
      [";"] = { ":", "enter command mode", opts = { nowait = true } },
      ["<C-S-Left>"] = { "<C-W>+", "Resize window up +2" },
      ["<C-S-Right>"] = { "<C-W>-", "Resize window down -2" },
      [ "<A-k>" ] = { ":m .-2<cr>==", "Move up" },
      [ "<A-j>" ] = { ":m .+1<cr>==", "Move " },
    },
    t = {
      -- ["<C-h>"] = { "<C-w>h", "Window left" },
      -- ["<C-l>"] = { "<C-w>l", "Window right" },
      -- ["<C-j>"] = { "<C-w>j", "Window down" },
      -- ["<C-k>"] = { "<C-w>k", "Window up" },
    },
    v = {
      [ "<A-j>" ] = { ":m '>+1<cr>gv=gv", "Move down" },
      [ "<A-k>" ] = { ":m '<-2<cr>gv=gv", "Move up" }, 
    },
    -- x = {

    -- }
}

-- more keybinds!

M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<A-h>"] = "",
  }
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      ""
      -- function()
        -- require("nvterm.terminal").toggle "float"
      -- end,
      -- "Toggle floating term",
    },
    ["<F1>"]= {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<F1>"]= {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
    ["<A-i>"] = {
      ""
      -- function()
      --   require("nvterm.terminal").toggle "float"
      -- end,
      -- "Toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

M.whichkey = {
  plugin = true,
  n = {
    ["<leader>n"] = {
      "",
      "+CustomCommands"
    },
    ["<leader>nn"] = {
      "<cmd>so $MYVIMRC<CR>",
      "Source Config"
    },
    ["<leader>ns"] = {
      "",""
    }
  }
}


return M
