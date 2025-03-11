return {
    "secretval/Utils.nvim",
    lazy = false,
    opts = {
        auto_inserts = {
            {
                filetype = "c",
                value = {
                    "\\#ifndef %:t:r_h",
                    "\\#define %:t:r_h",
                    "\\#endif // %:t:r_h",
                }
            }
        },
    },
}
