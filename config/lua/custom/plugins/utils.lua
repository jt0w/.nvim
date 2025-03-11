return {
    "secretval/Utils.nvim",
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
