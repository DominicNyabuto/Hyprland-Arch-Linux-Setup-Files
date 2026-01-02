---- For using external custom schemes that do not come with LazyVim
---
---
return {
  -- 1. Configure Catppuccin correctly
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      -- This is the correct key for Catppuccin to disable transparency
      transparent_background = true,

      -- Defining background color_overrides Comment out if you want defaults
      color_overrides = {
        mocha = {
          -- base = "#11111b",
          mantle = "#000000", -- Sidebar bg color
          --crust = "#000000",
        },
      },

      -- Catppuccin uses 'integrations' to handle plugin styling
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },

      -- Override Border Colors for File E
      custom_highlights = function(colors)
        local border_color = "#cba6f7" -- purple
        -- You can define new colors here or just use hex codes below
        local my_group_color = "#ff00ff" -- Example: Magenta/Pink for groups like 'buffer', 'code'
        local my_key_color = "#00ff00" -- Example: Bright Green for the keys 'f', 'b'
        local my_desc_color = "#ffffff" -- Example: White for the text description

        return {
          -- 1. General Floating Windows (LSP, LazyGit, etc.)
          FloatBorder = { fg = border_color },

          -- 2. Neo-tree (File Explorer)
          NeoTreeFloatBorder = { fg = border_color },
          NeoTreeWinSeparator = { fg = border_color },

          -- 3. Telescope (Grep/Find Files)
          TelescopeBorder = { fg = border_color },
          TelescopePromptBorder = { fg = border_color },
          TelescopeResultsBorder = { fg = border_color },
          TelescopePreviewBorder = { fg = border_color },

          -- 4. LazyGit (If not covered by FloatBorder)
          LazyGitBorder = { fg = border_color },

          -- 5. Mason (Package Installer)
          MasonBorder = { fg = border_color },

          -- WhichKey Menu Fonts (The new part)
          WhichKey = { fg = my_key_color }, -- The key (e.g. 'SPC', 'b')
          WhichKeyGroup = { fg = my_group_color }, -- The group folder (e.g. '+buffer', '+code')
          WhichKeyDesc = { fg = my_desc_color }, -- The command description
          WhichKeySeparator = { fg = border_color }, -- The arrow '->' (matching your border)
        }
      end,
    },
  },

  -- 2. Tell LazyVim to use this colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
