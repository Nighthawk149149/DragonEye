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

local function create(widget)
    local vlabel = Instance.new("TextLabel")
    vlabel.Name = "VersionLabel"
    vlabel.BackgroundTransparency = 1
    vlabel.Size = UDim2.new(1, 0, 0.1, 0)
    vlabel.AnchorPoint = Vector2.new(0, 0.5)
    vlabel.Position = UDim2.new(0, 0, 0.5, 0)
    vlabel.Text = "Getting current version..."
    vlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    vlabel.TextSize = 14
    vlabel.Parent = widget
end

local function getCurrentVersion(): {major: number?, minor: number?, patch: number?, label: string?}
    local currentVersion: string = require(game.ReplicatedStorage.DragonEyeShared.Settings).CurrentVersion

    -- Return the origin version as a table spliting the major, minor, and patches
    local version = currentVersion:split(".")
    return {
        major = tonumber(version[1]),
        minor = tonumber(version[2]),
        patch = tonumber(version[3]),
        label = currentVersion,
    }
end

local function getOriginVersion(): {major: number?, minor: number?, patch: number?, label: string?}
    -- Get the channel to check for updates on
    local channel: number | string = require(game.ReplicatedStorage.DragonEyeShared.Settings).VersionChannel
    channel = channel == 0 and "master" or channel == 1 and "develop" or "unknown"
    if channel == "unknown" then error("Add error handling here") end

    -- Get the origin version using httpservice
    local httpService = game:GetService("HttpService")
    local response = httpService:GetAsync("https://raw.githubusercontent.com/nickstienz/DragonEye/" .. channel .. "/VERSION.txt")

    -- Check if the response is valid
    if not response then error("Add error handling here") end

    -- Return the origin version as a table spliting the major, minor, and patches
    local version = response:split(".")
    return {
        major = tonumber(version[1]),
        minor = tonumber(version[2]),
        patch = tonumber(version[3]),
        label = response,
    }
end

local function isUpdateAvailable(): {update: boolean, currentVersion: {major: number?, minor: number?, patch: number?, label: string?}, originVersion: {major: number?, minor: number?, patch: number?, label: string?}}
    local currentVersion = getCurrentVersion()
    local originVersion = getOriginVersion()

    if currentVersion.label ~= originVersion.label then
        -- If the current version is not the same as the origin version, then there is an update available
        return {
            update = true,
            currentVersion = currentVersion,
            originVersion = originVersion,
        }
    end

    -- If all the checks fail, then there is no update available
    return {
        update = false,
        currentVersion = currentVersion,
        originVersion = originVersion,
    }
end

local function changeVersionLabel(widget, text)
    widget:FindFirstChild("VersionLabel").Text = text
end

return {
    create = create,
    getCurrentVersion = getCurrentVersion,
    getVersionData = isUpdateAvailable,
    changeVersionLabel = changeVersionLabel,
}