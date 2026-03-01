-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<leader>um", ":RenderMarkdown toggle<cr>", { desc = "Render Markdown Toggle" })
map("n", "<leader>ad", ":Copilot disable<cr>", { desc = "Disable Copilot" })
map("n", "<leader>ae", ":Copilot enable<cr>", { desc = "Enable Copilot" })
map("n", "<leader>ac", ":Copilot attach<cr>", { desc = "Attach Copilot" })
map("n", "<leader>az", ":Copilot detach<cr>", { desc = "Detach Copilot" })
map("n", "<leader>at", ":Codeium Toggle<cr>", { desc = "Codeium Toggle" })
