use crate::to_lua::lua::*;

pub struct Settings;

impl Settings {
    pub fn run() {
        // All of the options for the anti-cheat settings
        let options = vec!["! Test Data", "ToggleAntiCheatOnOrOff", "SetTest"];

        let mut lua = Lua::new();
        options.into_iter().for_each(|option| match &option[..1] {
            "T" => lua.push(format!("local {} = false\n", option).as_str()),
            "S" => lua.push(format!("local {} = 0\n", option).as_str()),
            "!" => lua.push(format!("--[[{} ]]--\n", option).as_str()),
            _ => panic!("Invalid option"),
        });
        lua.output("src/Lua/Shared/Settings.lua")
    }
}
