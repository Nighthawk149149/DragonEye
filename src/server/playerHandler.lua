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

-- Private variable for player data
local playerData = {}

-- Returns a copy of the player data table
function getAddData(): {}
    return playerData
end

-- Returns a copy of the players data within the player data table
function getPlayerData(player: Player): {}
    return playerData[player.UserId]
end

-- Adds a player to the player data table
function addPlayer(player: Player): ()
    playerData[player.UserId] = {
        name = player.Name,
        id = player.UserId,
    }
end

return {
    getAllData = getAddData,
    getPlayerData = getPlayerData,
    addPlayer = addPlayer,
}