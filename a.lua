for i = 1, 10 do
    vim.defer_fn(function()
        vim.notify("Hello " .. i, "info", { id = "test" })
    end, i * 500)
end
