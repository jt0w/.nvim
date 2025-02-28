-- yummy
return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        image        = { enabled = true },
        notifier     = { enabled = true },
        scope        = { enabled = true },
        statuscolumn = { enabled = true },
        toggle       = { enabled = true },
        scratch      = { enabled = true },
        terminal     = { enabled = true },
        words        = { enabled = true },
        picker       = { enabled = true },
        inputs       = { enabled = true },
    },
    keys = {
        { "<leader>f",  function() Snacks.picker.files()   end, desc = "Find Files",     mode = { "n", "t" } },
        { "<leader>b",  function() Snacks.picker.buffers() end, desc = "Find Buffers",                       },
        { "<leader>h",  function() Snacks.picker.help()    end, desc = "Help Pages"                          },
        { "<leader>s",  function() Snacks.picker.grep()    end, desc = "Grep",                               },
        { "<leader>m",  function() Snacks.picker.man()     end, desc = "Man Pages",                          },
        { "<C-,>",      function() Snacks.terminal()       end, desc = "Open Terminal",  mode = { "n", "t" } },
        { "<C-.>",      function() Snacks.scratch()        end, desc = "Open Scratch Buffer",                },
        { "<leader>go", function() Snacks.gitbrowse()      end, desc = "Open git project in browser"         },
    },
    config = function()
        Snacks.toggle.dim():map("<leader>tD")
        Snacks.toggle.zoom():map("<leader>z")
        Snacks.toggle.option("wrap"):map("<leader>w")
    end
}
