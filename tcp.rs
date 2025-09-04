// tcp.rs - Simple TCP stream handler

use std::io::prelude::*;
use std::net::TcpStream;

pub fn handle_tcp_stream(mut stream: TcpStream) {
    let response = "HTTP/1.1 200 OK\r\n\r\nHello from Copilot Server!";
    
    let mut buffer = [0; 1024];
    if let Ok(size) = stream.read(&mut buffer) {
        if size > 0 {
            println!("Received request: {}", String::from_utf8_lossy(&buffer[..size]));
        }
    }
    
    if let Err(e) = stream.write(response.as_bytes()) {
        println!("Error writing response: {}", e);
    }
    
    if let Err(e) = stream.flush() {
        println!("Error flushing stream: {}", e);
    }
}