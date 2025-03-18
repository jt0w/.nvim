require("avante_lib").load()

require("avante").setup {
    provider = "ollama",
    ollama = {
        model = "gemma3:1b",
    }
}
