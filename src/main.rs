use std::process::Command;

fn main() {
    println!("Hello, world!");
    let output = Command::new("git")
        .arg("log|head -n 1|awk '{printf $2}'")
        .output()
        .expect("git log command failed to run");

    println!("status: {}", output.status);
    println!("stdout: {}", String::from_utf8_lossy(&output.stdout));
    println!("stderr: {}", String::from_utf8_lossy(&output.stderr));
    assert!(output.status.success());
}
