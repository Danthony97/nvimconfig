local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local popup = Popup({
  enter = true,
  focusable = true,
  border = {
    style = "rounded",
    text = {
      top = "Neovim command cheatsheet",
      top_align = "center",
    },
  },
  position = "50%",
  size = {
    width = "80%",
    height = "60%",
  },
})

-- mount/open the component
popup:mount()

-- unmount component when cursor leaves buffer
popup:on(event.BufLeave, function()
  popup:unmount()
end)

popup:map("n", "<esc>", function(bufnr)
  popup:unmount()
end, { noremap = true })


-- set content
local home = os.getenv( "HOME" )
local rfile = io.open(home .. "/.config/nvim/lua/custom/files/cheatsheet.txt", "r")

for line in rfile:lines() do
  vim.api.nvim_buf_set_lines(popup.bufnr, -1, -1, false, {line})
end
