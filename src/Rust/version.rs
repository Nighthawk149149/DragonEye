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

pub struct Version;

impl Version {
    pub fn run() {
        let mut lua = Lua::new();

        let mut contents = String::new();
        File::open("./src/Data/settings.txt")
            .unwrap()
            .read_to_string(&mut contents)
            .unwrap();

        contents.lines().for_each(|line| {
            if line.starts_with("CurrentVersion = ") {
                let mut split = line.split('"');
                let version = split.nth(1).unwrap().trim();
                lua.push(version);
            }
        });

        lua.output("./VERSION.txt")
    }
}
