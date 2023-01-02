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
        let mut new_line = false;

        let mut lua = Lua::new();
        lua.header();
        lua.push("return {\n");

        let mut contents = String::new();
        File::open("./src/Data/settings.txt")
            .unwrap()
            .read_to_string(&mut contents)
            .unwrap();

        contents.lines().for_each(|mut line| {
            line = line.trim();

            // Remove comments and empty lines
            if line.is_empty() || line.starts_with('!') {
                return;
            }

            if line.starts_with('[') {
                if new_line {
                    lua.push(format!("\n--[{}]--\n", line).as_str());
                } else {
                    lua.push(format!("--[{}]--\n", line).as_str());
                    new_line = true;
                }
                return;
            }

            let mut split_at_equals = line.split('=');
            let name = split_at_equals.next().unwrap().trim();
            let mut split_at_colon = split_at_equals.next().unwrap().split(':');
            let value = split_at_colon.next().unwrap().trim();
            let comment = split_at_colon.next().unwrap().trim();

            let value_type;
            if value == "true" || value == "false" {
                value_type = "boolean";
            } else if value.parse::<f64>().is_ok() {
                value_type = "number";
            } else {
                value_type = "string";
            }

            lua.push(
                format!(
                    "\t-- {}\n\t{} = {}, -- {} (Default: {})\n",
                    comment, name, value, value_type, value
                )
                .as_str(),
            );
        });

        lua.push("}");
        lua.output("./src/Luau/Shared/settings.lua")
    }
}
