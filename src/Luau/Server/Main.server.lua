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

-- Log the start of the server
local log = require(game.ReplicatedStorage.DragonEyeShared.Debug.Log)

log.write(log.codes.server.log, script:GetFullName(), "Starting...")

-- Check for Dragon Eye Version
-- https://raw.githubusercontent.com/Nighthawk149149/DragonEye/master/VERSION.txt
local currentVersion = game.ReplicatedStorage.DragonEyeShared.Settings.Version
local serverVersion

local httpService = game:GetService("HttpService")
local success, err = pcall(function() serverVersion = httpService:GetAsync("https://raw.githubusercontent.com/Nighthawk149149/DragonEye/master/VERSION.txt") end)
if success then
    if currentVersion ~= serverVersion then
        log.write(log.codes.server.warn, script:GetFullName(), "The local version and server version do not match! Please update the Anti-Cheat to the latest version.")
    end
elseif err:lower():find("http requests are not enabled") then
    log.write(log.codes.server.http_not_enabled, script:GetFullName(), err)
else
    log.write(log.codes.server.http_fail, script:GetFullName(), err)
end