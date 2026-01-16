//
//  BlockyTransform.swift
//  blocksay
//
//  Created by Matías Martínez on 15/1/26.
//

struct BlockyTransform {
  var font: BlockyFont = .defaultFont
  var letterSpacing: Int = 1
}

extension StringProtocol {
  
  func applyingBlockyTransform(_ transform: BlockyTransform) -> String {
    let font = transform.font
    let letterSpacing = transform.letterSpacing
    let letterSpacer = String(repeating: " ", count: letterSpacing)
    let characterWidths = font.characterWidths
    let glyphsByLine = font.glyphsByLine
    let lineCount = glyphsByLine.count

    var letterIndexes: [Int] = []
    var totalGlyphWidth = 0
    for scalar in unicodeScalars {
      let value = scalar.value
      let letterIndex: Int
      if value >= 65 && value <= 90 { // A-Z
        letterIndex = Int(value - 65)
      } else if value >= 97 && value <= 122 { // a-z
        letterIndex = Int(value - 97)
      } else {
        continue
      }

      letterIndexes.append(letterIndex)
      totalGlyphWidth += characterWidths[letterIndex]
    }

    guard lineCount > 0 else { return "" }
    guard !letterIndexes.isEmpty else {
      return String(repeating: "\n", count: lineCount - 1)
    }

    let totalSpacingWidth = letterSpacing * letterIndexes.count
    let perLineCapacity = totalGlyphWidth + totalSpacingWidth

    var output = String()
    output.reserveCapacity((perLineCapacity + 1) * lineCount)

    if letterSpacing == 0 {
      for lineIndex in 0..<lineCount {
        let lineGlyphs = glyphsByLine[lineIndex]
        for letterIndex in letterIndexes {
          output.append(contentsOf: lineGlyphs[letterIndex])
        }
        if lineIndex + 1 < lineCount {
          output.append("\n")
        }
      }
    } else {
      for lineIndex in 0..<lineCount {
        let lineGlyphs = glyphsByLine[lineIndex]
        for letterIndex in letterIndexes {
          output.append(contentsOf: lineGlyphs[letterIndex])
          output.append(contentsOf: letterSpacer)
        }
        if lineIndex + 1 < lineCount {
          output.append("\n")
        }
      }
    }

    return output
  }
  
}
