return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        close_command = "bd %d",
        indicator = {
          style = "icon",
          icon = "▎",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "󰜷",
        right_trunc_marker = "󰜵",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and " ERR " .. diag.error or "")
            .. (diag.warning and " WARN " .. diag.warning or "")
          return #ret > 0 and ret or nil
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "NvimTree",
            highlight = "Directory",
          },
          {
            filetype = "qf",
            text = "Quickfix",
            highlight = "QuickFix",
          },
        },
        separator_style = "thin",
        always_show_bufferline = true,
        diagnostics_update_in_insert = false,
      },
    }
  end,
}
