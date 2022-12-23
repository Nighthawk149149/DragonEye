/*
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
*/

use std::{fs::File, io::Read};

use crate::to_lua::lua::Lua;

pub struct Settings;

impl Settings {
    pub fn run() {
        let mut lua = Lua::new();
        lua.push("return {\n");

        let mut contents = String::new();
        File::open("./src/Data/settings.txt")
            .unwrap()
            .read_to_string(&mut contents)
            .unwrap();
        contents.lines().for_each(|line| {
            if line.trim().is_empty() || line.starts_with('!') {
                return;
            }
            let mut split = line.split(':');
            let var_type = match split.next().unwrap() {
                "B" => "boolean",
                "N" => "number",
                _ => panic!("Invalid type"),
            };
            let var_name = split.next().unwrap();
            let var_value = split.next().unwrap();
            let var_comment = split.next().unwrap();

            lua.push(
                format!(
                    "\t--[[ {} ]]--\n\t{} = {}, -- {} (Default: {})\n",
                    var_comment, var_name, var_value, var_type, var_value
                )
                .as_str(),
            );
        });
        lua.push("}");
        lua.output("./src/Luau/Shared/settings.lua")
    }
}
