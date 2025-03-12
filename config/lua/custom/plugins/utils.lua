return {
    "secretval/Utils.nvim",
    lazy = false,
    opts = {
        auto_inserts = {
            {
                filetype = "c",
                filesuffix = "h",
                value = {
                    "\\#ifndef %:t:r_h",
                    "\\#define %:t:r_h",
                    "\\#endif // %:t:r_h",
                }
            },
            {
                filetype = "norg",
                cmd = "Neorg inject-metadata",
            }
        },
    },
}
