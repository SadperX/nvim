-- Copyright (c) 2021 Jnhtr
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
  black        = '#1c1e26',
  white        = '#adb5bd',
  red          = '#9b2226',
  green        = '#609F3A',
  blue         = '#254B6D',
  yellow       = '#ee9b00',
  gray         = '#665c54',
  lightgray    = '#353535',
  darkgray     = '#282828',
  inactivegray = '#353535',
}

return {
  normal = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.darkgray, fg = colors.white },
  },
  insert = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.darkgray, fg = colors.white },
  },
  visual = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.darkgray, fg = colors.white },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.darkgray, fg = colors.white },
  },
  command = {
    a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.darkgray, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.inactivegray, fg = colors.white, gui = 'bold' },
    b = { bg = colors.inactivegray, fg = colors.white },
    c = { bg = colors.inactivegray, fg = colors.white },
  },
}
