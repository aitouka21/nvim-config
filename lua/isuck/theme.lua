local function set_default_theme()
  local transparent_highlights = {
    "Normal",
    "NormalNC",
    "LineNr",
    "Folded",
    "NonText",
    "SpecialKey",
    "VertSplit",
    "SignColumn",
    "EndOfBuffer",
    "TablineFill",
  }

  for _, hl in ipairs(transparent_highlights) do
    vim.cmd.highlight(hl .. " guibg=NONE ctermbg=NONE")
  end
end

local function set_theme_same_as_alacritty()
  -- inspect the selected theme in alacritty toml
  local theme = vim.fn.system([[perl -nE 'print $1 if /themes\/themes\/(.+).toml/'  ~/.config/alacritty/alacritty.toml]])
  if theme == "catppuccin" then
    vim.cmd.colorscheme("catppuccin")
  else
    set_default_theme()
  end
end

local term = os.getenv("TERM")
if term == "alacritty" then
  set_theme_same_as_alacritty()
else
  set_default_theme()
end
