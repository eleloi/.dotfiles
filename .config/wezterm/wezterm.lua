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

-- Exact Rose Pine palette with a darker background
config.colors = {
  foreground = "#e0def4",
  background = "#111019",
  cursor_bg = "#e0def4",
  cursor_fg = "#111019",
  selection_bg = "#26233a",
  selection_fg = "#e0def4",
  ansi = {
    "#191724", "#eb6f92", "#31748f", "#f6c177",
    "#9ccfd8", "#c4a7e7", "#ebbcba", "#e0def4"
  },
  brights = {
    "#6e6a86", "#eb6f92", "#31748f", "#f6c177",
    "#9ccfd8", "#c4a7e7", "#ebbcba", "#524f67"
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
