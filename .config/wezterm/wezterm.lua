local wezterm = require 'wezterm'
local act = wezterm.action

-- We import a small file that the script will edit for font selection
local font_choice = {
  family = "Mononoki Nerd Font Mono",
  size = 18.0
}

-- Try to load the dynamic font config if it exists
pcall(function()
  font_choice = dofile(wezterm.home_dir .. "/.config/wezterm/font_choice.lua")
end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font({
  family = font_choice.family,
  harfbuzz_features = { '-calt', '-liga', '-clig' },
})
config.font_size = font_choice.size

config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_background_opacity = 0.9
config.text_background_opacity = 0.9
config.front_end = "OpenGL"
config.enable_wayland = true

-- Enable Kitty keyboard protocol for reliable Ctrl+Enter / Shift+Enter detection
-- in tmux (csi-u format). Without this, wezterm may not pass modified Enter
-- keys through tmux consistently. See:
-- https://sw.kovidgoyal.net/kitty/keyboard-protocol/
-- https://github.com/earendil-works/pi-mono/blob/main/docs/terminal-setup.md#wezterm
config.enable_kitty_keyboard = true

-- Exact Solarized Osaka palette, vivid variant (from
-- craftzdog/solarized-osaka.nvim, vivid_brightness = 0.3)
config.colors = {
  foreground = "#a0b4b6",
  background = "#001419",
  cursor_bg = "#a0b4b6",
  cursor_fg = "#001419",
  selection_bg = "#063540",
  selection_fg = "#c2cdcd",
  ansi = {
    "#001419", "#ff6c6a", "#a2bb00", "#dba500",
    "#5aaefa", "#fe67a8", "#34c5b9", "#b6c5c6"
  },
  brights = {
    "#002c38", "#ff6c6a", "#a2bb00", "#dba500",
    "#5aaefa", "#fe67a8", "#34c5b9", "#c2cdcd"
  },
}

-- Keyboard bindings
config.keys = {
  -- Custom Zoom with Notification
  {
    key = '=',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      if not overrides.font_size then
        overrides.font_size = config.font_size
      end
      overrides.font_size = overrides.font_size + 1
      window:set_config_overrides(overrides)
      window:toast_notification('WezTerm', 'Font Size: ' .. overrides.font_size, nil, 2000)
    end),
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      if not overrides.font_size then
        overrides.font_size = config.font_size
      end
      overrides.font_size = overrides.font_size - 1
      window:set_config_overrides(overrides)
      window:toast_notification('WezTerm', 'Font Size: ' .. overrides.font_size, nil, 2000)
    end),
  },
  {
    key = '0',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      window:set_config_overrides({})
      window:toast_notification('WezTerm', 'Font Size Reset to ' .. config.font_size, nil, 2000)
    end),
  },
}

-- TMUX style: Ensure the terminal identifies as 256color or tmux
config.term = "xterm-256color"

return config
