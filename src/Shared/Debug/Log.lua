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

local p, f = print, string.format

--[[
    Test/Extra Codes start at:  0
    Server Codes Start at:      100
    Client Codes Start at:      200
    Shaded Codes Start at:      300
]]--
local codes = {
    test = 0,

    server = {
        Log = 100,
        Warn = 101,
    }
}

local function write(code: number, file: string, message: string): ()
    p(f("[Dragon Eye] (%s) Error: %d, Message: %s", file, code, message))
end

return {
    write = write,
    codes = codes,
}