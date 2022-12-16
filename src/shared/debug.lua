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

local RunService = game:GetService("RunService")

local logCodes = {
    LogServer               = "LS",
    LogClient               = "LC",
    WarnServer              = "WS",
    WarnClient              = "WC",
    ErrorServerCompromised  = "ES0", -- Deadly error, server is compromised!
}

local function log(logType: string, message: string): ()
    print("[DE] (" .. logType .. ") " .. message)

    -- Panic mode if error and it is on the server
    if logType:sub(1,1) == "E" and RunService:IsServer() then
        -- TODO: Panic mode (This will take a while)
        warn("[DE] Error detected! Starting panic mode...")
    end
end

return {
    log = log,
    logCode = logCodes,
}