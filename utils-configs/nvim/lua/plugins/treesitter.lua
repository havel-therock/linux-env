return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local ts = require("nvim-treesitter")

      -- Initialize nvim-treesitter
      ts.setup()

      -- Install the parsers you want
      ts.install({
        "cpp",
        "c",
        "python",
        "lua",
      })

      -- Start Treesitter for supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "python",
          "lua",
        },
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
