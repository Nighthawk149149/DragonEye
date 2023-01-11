--[[
Dragon Eye - A universal Roblox Anti-Cheat
Copyright (C) 2022  Nicholas Stienz <nickstienz@gmail.com>
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]--
--!strict

-- Init toolbar button
local toolbar  = plugin:CreateToolbar("Dragon Eye Gui")

local pluginButton = toolbar:CreateButton(
    "Open Dragon Eye", --Text that will appear below button
    "Button to open Dragon Eye", --Text that will appear if you hover your mouse on button
    "rbxassetid://11892608935") --Button icon

-- Create the widget
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	false,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	400,    -- Default width of the floating window
	400,    -- Default height of the floating window
	400,    -- Minimum width of the floating window
	400     -- Minimum height of the floating window
)

-- Create new widget GUI
local widget = plugin:CreateDockWidgetPluginGui("DragonEyeWidget", widgetInfo)
widget.Title = "Dragon Eye"  -- Optional widget title

-- Load the versionLabel module
local versionLabel = require(script.Parent.Widget.VersionLabel)
versionLabel.create(widget) -- Create the label

versionLabel.changeVersionLabel(widget, versionLabel.getCurrentVersion().label) -- Change label to the current version

-- Open or close the plugin
pluginButton.Click:Connect(function()
    widget.Enabled = not widget.Enabled
end)