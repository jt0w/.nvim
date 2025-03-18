require("avante_lib").load()

require("avante").setup {
    provider = "ollama",
    ollama = {
        model = "deepseek-r1",
    }
}
