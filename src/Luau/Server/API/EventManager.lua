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
--!nonstrict

local log = require(game.ReplicatedStorage.DragonEyeShared.Debug.Log)

local EventManager = {}
local eventFunctions = {}

-- This will take a number (the event ID) and a function which can be called by the event ID using Fire.
-- This can be used to create communication between different scripts throughout the entire game (once the client-side portion is implemented)
function EventManager:Connect(event: number, func)
    if eventFunctions[event] == nil then
        eventFunctions[event] = {}
    end
    table.insert(eventFunctions[event], func)
end

-- This will use the ID and whatever variables you pass.
-- It will call all functions with the same ID so if an event like "ping" is called, all functions with the ID "ping" will be called and can handle said event.
function EventManager:Fire(event: number, var)
    if eventFunctions[event] == nil then
        log.write(log.codes.general.warn, script:GetFullName(), "Event " .. event .. " does not exist!")
        return
    end

    for i=1, #eventFunctions[event], 1 do
        eventFunctions[event][i](var)
    end
end

return EventManager