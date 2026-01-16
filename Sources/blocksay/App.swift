//
//  App.swift
//  blocksay
//
//  Created by Matías Martínez on 15/1/26.
//

@main
struct App {
  
  static func main() {
    let input = CommandLine.arguments[1...].joined()
    
    guard !input.isEmpty else {
        return
    }
    
    let transform = BlockyTransform()
    let output = input.applyingBlockyTransform(transform)
    
    print(output)
  }
  
}
