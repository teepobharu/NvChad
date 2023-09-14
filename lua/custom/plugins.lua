local overrides = require("custom.configs.overrides")
local vkey = vim.keymap
local utils = require("custom.utils")
vim.g.maplocalleader = ","
local opts = { noremap = true, silent = true }
-- local function combined_dict(dict1, dict2)
--   return vim.tbl_extend("keep", dict1, dict2)
-- end

local mappingFunction = { }

mappingFunction.close_preview = function(prompt_bufnr)
  local telescope_state = require('telescope.actions.state')
  local current_picker = telescope_state.get_current_picker(prompt_bufnr)
  current_picker:close_preview()
end

mappingFunction.lcd_preview = function(prompt_bufnr)
  local telescope_state = require('telescope.actions.state')
  local current_picker = telescope_state.get_current_picker(prompt_bufnr)
  current_picker:lcd_preview()
end

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "justinmk/vim-sneak",
    lazy = true,
  },
  {
    
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    -- set keys in mymappings since overriden by default map 
    keys = { },
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true
      vim.g['copilot_no_tab_map'] = true
        vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Acceptt("\\<CR>")', {expr=true, silent=true})
    end,
    keys = {
      -- mapping source : https://www.reddit.com/r/neovim/comments/qsfvki/how_to_remap_copilotvim_accept_method_in_lua/
      --
      -- { "<leader>c.", { "", mode = "i"}, desc = "Copilot next" },
      -- { "<leader>c,", { "", mode = "i"}, desc = "Copilot prev" },
      -- { "<leader>c,", { 'copilot#Accept(“<CR>”)', mode = "i" } },
      -- { "<C-e>", { 'copilot#Accept(“<CR>”)', mode = "i" }, desc = "Copilot accept" },
      -- sample with mode settings => https://github.com/LazyVim/LazyVim/blob/566049aa4a26a86219dd1ad1624f9a1bf18831b6/lua/lazyvim/plugins/coding.lua#L28C44-L28C44
      --
      -- { "<C-/>", 'copilot#Accept("<CR>")', { mode = "i",  desc = "Copilot accept", silent = true, expr = true }},
      { "<C-E>",
        function()
        -- vim.fn("copilot#Accept(“<CR>”)")
        vim.fn["copilot#Accept"]("<CR>")
      end, mode = "i" ,  desc = "Copilot accept", expr = true, silent = true},
       -- { "<C-a>", { "<C-x>", mode = "n" } },
      { "<leader>ce", "<cmd>Copilot panel<cr>”)", desc = "Copilot suggest" }, 
    }
  },
  {
    "mhinz/vim-startify",
    lazy = false,
    config = function()
      require('custom.configs.startify')
      vkey.set('n', "<localleader>,", "<cmd>Startify<cr>", utils.combine_dicts(opts, {desc = "Startify"}))
      vkey.set('n', "<leader>,", "<cmd>Startify<cr>", utils.combine_dicts(opts, {desc = "Startify"}))
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<localleader>"},
    -- keys = {  "<localleader>", "<leader>", '"', "'", "`", "c", "v", "g" },
  },


  {
   "nvim-telescope/telescope.nvim",

    opts = {

      defaults = {
        pickers = {
          find_files = {
            mappings = {
              n = {
                -- does not work not sure 
                -- ref example recipe
                -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories
                -- source code
                -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L97
              }
            }
          },
        },

        -- https://github.com/nvim-telescope/telescope.nvim#default-mappings
        mappings = {
          -- to get desc (extract from object ?): https://github.com/nvim-telescope/telescope.nvim/blob/dc192faceb2db64231ead71539761e055df66d73/lua/telescope/mappings.lua#L208
          i = {
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end, 
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end, 
            ["<C-h>"] = function(...)
              require("telescope.actions").results_scrolling_left(...)
            end, 
            ["<C-l>"] = function(...)
              require("telescope.actions").results_scrolling_right(...)
            end, 
          },
          -- When the search text is focused 
          n = {
            -- name appear when hit ? but not exectuable
              -- ["<esc>"] = mappingFunction.close_preview,
              -- ["cd"] = mappingFunction.lcd_preview,
           
          -- See default mappings / fn name here: https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L154
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end, 
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end, 
            ["<C-h>"] = function(...)
              require("telescope.actions").results_scrolling_left(...)
            end, 
            ["<C-l>"] = function(...)
              require("telescope.actions").results_scrolling_right(...)
            end, 
            ["<esc>"] = function(...)
              require("telescope.actions").close(...)
            end,
            ["cd"] = function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              local dir = vim.fn.fnamemodify(selection.path, ":p:h")
              -- require("telescope.actions").close(prompt_bufnr)

              print("lcd to " .. dir) 
              -- Depending on what you want put `cd`, `lcd`, `tcd`
              vim.cmd(string.format("silent lcd %s", dir))
            end
          },
        },
      },
    },
  }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

-- call plug#begin('~/.config/nvim/autoload/plugged')

--   Plug 'github/copilot.vim'
--   " Change dates fast
--   Plug 'tpope/vim-speeddating'
--   " Convert binary, hex, etc..
--   Plug 'glts/vim-radical'
--   " Files
--   Plug 'tpope/vim-eunuch'
--   " Repeat stuff
--   Plug 'tpope/vim-repeat'
--   " Surround
--   Plug 'tpope/vim-surround'
--   " Better Comments
--   Plug 'tpope/vim-commentary'
--   " Key for faster navigationns [q 
--   Plug 'tpope/vim-unimpaired'
--   " Plug 'preservim/nerdcommenter'
--   " Have the file system follow you around
--   Plug 'airblade/vim-rooter'
--   " auto set indent settings
--   Plug 'tpope/vim-sleuth'

--   if exists('g:vscode')
--     " Easy motion for VSCode
--     Plug 'asvetliakov/vim-easymotion'

--   else
--     " Text Navigation
--     Plug 'justinmk/vim-sneak'
--     " Plug 'unblevable/quick-scope'
--     Plug 'easymotion/vim-easymotion'
--     " Add some color
--     Plug 'norcalli/nvim-colorizer.lua'
--     Plug 'junegunn/rainbow_parentheses.vim'
--     " Better Syntax Support
--     Plug 'sheerun/vim-polyglot'
--     " Cool Icons
--     Plug 'ryanoasis/vim-devicons'
--     " Auto pairs for '(' '[' '{' 
--     Plug 'jiangmiao/auto-pairs'
--     " Closetags
--     Plug 'alvan/vim-closetag'
--     " Themes
--     " Plug 'christianchiarulli/onedark.vim'
--     Plug 'joshdick/onedark.vim'
--     Plug 'kaicataldo/material.vim'
--     Plug 'NLKNguyen/papercolor-theme'
--     Plug 'tomasiser/vim-code-dark'
--     " Intellisense
--     Plug 'neoclide/coc.nvim', {'branch': 'release'}
--     " Status Line
--     Plug 'vim-airline/vim-airline'
--     Plug 'vim-airline/vim-airline-themes'
--     " Ranger
--     " Plug 'francoiscabrol/ranger.vim'
--     Plug 'rbgrouleff/bclose.vim'
--     " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
--     " FZF
--     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
--     Plug 'junegunn/fzf.vim'
--     " Git
--     Plug 'mhinz/vim-signify'
--     Plug 'airblade/vim-gitgutter'
--     Plug 'tpope/vim-fugitive'
--     Plug 'idanarye/vim-merginal'
--     Plug 'tpope/vim-rhubarb'
--     Plug 'junegunn/gv.vim'
--     Plug 'stsewd/fzf-checkout.vim'
--     " Terminal
--     Plug 'voldikss/vim-floaterm'
--     " Start Screen
--     Plug 'mhinz/vim-startify'
--     " Vista
--     Plug 'liuchengxu/vista.vim'
--     " See what keys do like in emacs
--     Plug 'liuchengxu/vim-which-key'
--     " Zen mode
--     Plug 'junegunn/goyo.vim'
--     " Making stuff
--     Plug 'neomake/neomake'
--     " Snippets
--       " Plug 'honza/vim-snippets' " Disable on 2023-05-19  coc-snippets already worked
--       Plug 'mattn/emmet-vim'
--     " Better Comments
--     " Plug 'jbgutierrez/vim-better-comments'
--     " Echo doc
--     " Plug 'Shougo/echodoc.vim'
--     " Interactive code
--     " Plug 'ChristianChiarulli/codi.vim' " Not working anymore
--     Plug 'metakirby5/codi.vim'
--     " Vim Wiki
--     Plug 'https://github.com/vimwiki/vimwiki.git'

--     " == My extra ==
--     " Buffer Management
--     Plug 'vim-ctrlspace/vim-ctrlspace'
--     " Omni sharp
--     " Plug 'OmniSharp/omnisharp-vim
--     " Plug 'scrooloose/nerdtree'
--     Plug 'houtsnip/vim-emacscommandline'
--     " Tmux vim switch integration
--     Plug 'christoomey/vim-tmux-navigator'
--     "HTML EMMET
--     Plug 'mattn/emmet-vim'
--     Plug 'AndrewRadev/tagalong.vim'
--   endif

return plugins
