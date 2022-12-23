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
pub struct Lua {
    pub script: String,
}

impl Lua {
    pub fn new() -> Lua {
        let mut lua = Lua {
            script: String::new(),
        };

        lua.header();
        return lua;
    }

    pub fn push(&mut self, line: &str) {
        self.script.push_str(line);
    }

    pub fn header(&mut self) {
        self.push(
            "--[[
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
--!strict\n",
        )
    }

    pub fn output(self, path: &str) {
        // Output the scirpt to a file at the given path
        use std::fs::File;
        use std::io::prelude::*;

        let mut file = File::create(path).unwrap();
        file.write_all(self.script.as_bytes()).unwrap();
    }
}
