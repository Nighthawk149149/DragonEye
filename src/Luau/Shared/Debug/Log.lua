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

local codes = require(script.Parent.Codes)
local p, f = print, string.format
local doLog = game.ReplicatedStorage.DragonEyeShared.Settings.EnableLogging
local shorten = game.ReplicatedStorage.DragonEyeShared.Settings.ShortenLogs

local function write(code: number, file: string, message: string): ()
    if doLog then
        if shorten then
            p(f("[DE] %s", message))
        else
            p(f("[Dragon Eye] (%s) Code: %d, Message: %s", file, code, message))
        end
    end
end

return {
    write = write,
    codes = codes,
}