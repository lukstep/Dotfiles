return {
    cmd = {
            "clangd",
            "--background-index",
            "--suggest-missing-includes",
            "-j=4",
            "--log=verbose"
        },
    filetypes = {"c", "cpp", "objc", "objcpp"},
}
