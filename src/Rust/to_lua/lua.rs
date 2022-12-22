pub struct Lua {
    pub script: String,
}

impl Lua {
    pub fn new() -> Lua {
        Lua {
            script: String::new(),
        }
    }

    pub fn push(&mut self, line: &str) {
        self.script.push_str(line);
    }

    pub fn output(self, path: &str) {
        // Output the scirpt to a file at the given path
        use std::fs::File;
        use std::io::prelude::*;

        let mut file = File::create(path).unwrap();
        file.write_all(self.script.as_bytes()).unwrap();
    }
}
