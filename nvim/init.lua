require("config")

function delete_directory(folder)
   local path = vim.b.netrw_curdir .. package.config:sub(1,1) .. folder
   local answer = vim.fn.input("Are you sure you want to delete " .. path .. "? [y/N] ")   
   
   if answer:lower() == "y" then
      vim.cmd("!rm -r " .. path)     
      print("Directory deleted: " .. path)   
   else 
      print("Did not delete: " .. path)   
   end
end
 
function copy_error()
   local message = vim.api.nvim_exec("messages", true) 
   vim.api.nvim_command("let @* = " .. vim.fn.shellescape(message))
end

vim.api.nvim_command("command! -nargs=1 RD lua delete_directory('<f-args>')")
vim.api.nvim_command("command! CE lua copy_error()")

vim.opt.mouse = "a"
vim.cmd("filetype plugin indent on")
vim.opt.background = "dark" 
vim.cmd([[colorscheme gruvbox]])
vim.opt.clipboard = "unnamedplus"
