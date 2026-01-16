//
//  App.swift
//  blocksay
//
//  Created by Matías Martínez on 15/1/26.
//

import Foundation

@main
struct App {
  
  static func main() {
    let input = CommandLine.arguments.dropFirst().joined()
    
    guard !input.isEmpty else {
        return
    }
    
    let transform = BlockyTransform()
    let output = input.applyingBlockyTransform(transform)
    
    print(output)
  }
  
}
