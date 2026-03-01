-- I am leaving this here as an alternative to nvim-surround
if true then
  return {}
end

return {
  "nvim-mini/mini.surround",
  version = "*",
  config = function()
    require("mini.surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}

-- Keymaps: Note that be quick when typing the commands
--          because `s` in its own is set for flash search
--
-- mappings = {
--     add = 'sa', -- Add surrounding in Normal and Visual modes
--     delete = 'sd', -- Delete surrounding
--     find = 'sf', -- Find surrounding (to the right)
--     find_left = 'sF', -- Find surrounding (to the left)
--     highlight = 'sh', -- Highlight surrounding
--     replace = 'sr', -- Replace surrounding
--     update_n_lines = 'sn', -- Update `n_lines`
--
--     suffix_last = 'l', -- Suffix to search with "prev" method
--     suffix_next = 'n', -- Suffix to search with "next" method
--   },
