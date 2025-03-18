require("avante_lib").load()

require("avante").setup {
    provider = "ollama",
    cursor_applying_provider = "ollama", -- In this example, use Groq for applying, but you can also use any provider you want.
    behaviour = {
        enable_cursor_planning_mode = true, -- enable cursor planning mode!
    },
    ollama = {
        model = "gemma3:27b",
    }
}
