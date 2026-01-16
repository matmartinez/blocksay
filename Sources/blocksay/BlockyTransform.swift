//
//  BlockyTransform.swift
//  blocksay
//
//  Created by Matías Martínez on 15/1/26.
//

import Foundation

struct BlockyTransform {
  var font: BlockyFont = .defaultFont
  var letterSpacing: Int = 1
}

extension StringProtocol {
  
  func applyingBlockyTransform(_ transform: BlockyTransform) -> String {
    let font = transform.font
    let letterSpacer = Array(repeating: " ", count: transform.letterSpacing).joined()
    
    let asciiArtLines = font.ascii.split(separator: "\n")
    let characterWidths = font.characterWidths
    let cumulativeOffsets = font.cummulativeCharacterOffsets
    
    let normalized = lowercased()
    var lines: [String] = []

    for lineIndex in 0..<asciiArtLines.count {
      var outputLine = ""

      for scalar in normalized.unicodeScalars {
        guard scalar.value >= 97 && scalar.value <= 122 else { continue } // a-z

        let letterIndex = Int(scalar.value - 97)
        let startOffset = cumulativeOffsets[letterIndex]
        let width = characterWidths[letterIndex]

        outputLine += asciiArtLines[lineIndex].substring(start: startOffset, length: width)
        outputLine += letterSpacer
      }

      lines.append(outputLine)
    }
    
    return lines.joined(separator: "\n")
  }
  
}

fileprivate extension String.SubSequence {
  func substring(start: Int, length: Int) -> String {
    guard length > 0 else { return "" }
    guard start >= 0 else { return "" }

    let startIndex = index(self.startIndex, offsetBy: start, limitedBy: endIndex) ?? endIndex
    let endIndex = index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex

    if startIndex >= endIndex { return "" }
    return String(self[startIndex..<endIndex])
  }
}
