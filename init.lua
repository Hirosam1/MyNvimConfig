-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("user.vim_options")
--Sttings and plugin definition for Lazy package manager.
require("user.lazy_settings")
--Set up colortils
require("colortils").setup()

-- [[ Setting options ]]
-- See `:help vim.o`
local colorsheme = "slimeling"
require("user.theme_settings").set(colorsheme)

require("nvim-tree").setup({
  renderer = {
    highlight_opened_files = "name",
    add_trailing = true,
    indent_markers = {
      enable = true,
    }
  },

  update_focused_file = {
    enable = true
  }
}
)

require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
      sections = {
          lualine_z = {'location',{'datetime',style=" %H:%M %d/%m"}}
    }

}


-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

--Configure treesitter
require("user.treesitter_settings")
require("user.vim_commands")

local on_attach = require("user/on_attach_lsp_commands")

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  pylsp={
  -- Removes pycodestyle from pylsp config.
  -- Avoids polluting the screen with warning
  -- on a pre-existing project.
    autostart = true,
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false
        },
        jedi = {
          environment="/usr/bin/python3"
        }
      }
    }
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

require("user.cmp_settings")
