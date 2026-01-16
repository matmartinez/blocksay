//
//  BlockyFont.swift
//  blocksay
//
//  Created by Matías Martínez on 15/1/26.
//

struct BlockyFont {
  let ascii: String
  let characterWidths: [Int]
  
  private(set) var asciiLines: [Substring]
  private(set) var cummulativeCharacterOffsets: [Int]
  private(set) var glyphsByLine: [[String]]

  init(ascii: String, characterWidths: [Int]) {
    self.ascii = ascii
    self.characterWidths = characterWidths
    
    let asciiLines = ascii.split(separator: "\n")
    self.asciiLines = asciiLines

    var offsets: [Int] = []
    offsets.reserveCapacity(characterWidths.count)
    var currentOffset = 0
    for width in characterWidths {
      offsets.append(currentOffset)
      currentOffset += width
    }
    self.cummulativeCharacterOffsets = offsets

    var glyphsByLine: [[String]] = []
    glyphsByLine.reserveCapacity(asciiLines.count)
    for line in asciiLines {
      var lineGlyphs: [String] = []
      lineGlyphs.reserveCapacity(characterWidths.count)
      for (letterIndex, width) in characterWidths.enumerated() {
        let startOffset = offsets[letterIndex]
        lineGlyphs.append(line.substring(start: startOffset, length: width))
      }
      glyphsByLine.append(lineGlyphs)
    }
    self.glyphsByLine = glyphsByLine
  }
  
  static let defaultFont: BlockyFont = .init(
    ascii:
      """
       ▗▄▖ ▗▄▄▖  ▗▄▄▖▗▄▄▄ ▗▄▄▄▖▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖▗▄▄▄▖   ▗▖▗▖ ▗▖▗▖   ▗▖  ▗▖▗▖  ▗▖ ▗▄▖ ▗▄▄▖ ▗▄▄▄▖ ▗▄▄▖  ▗▄▄▖▗▄▄▄▖▗▖ ▗▖▗▖  ▗▖▗▖ ▗▖▗▖  ▗▖▗▖  ▗▖▗▄▄▄▄▖
      ▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌  █▐▌   ▐▌   ▐▌   ▐▌ ▐▌  █     ▐▌▐▌▗▞▘▐▌   ▐▛▚▞▜▌▐▛▚▖▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌ ▐▌ ▐▌▐▌     █  ▐▌ ▐▌▐▌  ▐▌▐▌ ▐▌ ▝▚▞▘  ▝▚▞▘    ▗▞▘
      ▐▛▀▜▌▐▛▀▚▖▐▌   ▐▌  █▐▛▀▀▘▐▛▀▀▘▐▌▝▜▌▐▛▀▜▌  █     ▐▌▐▛▚▖ ▐▌   ▐▌  ▐▌▐▌ ▝▜▌▐▌ ▐▌▐▛▀▘ ▐▌ ▐▌ ▐▛▀▚▖ ▝▀▚▖  █  ▐▌ ▐▌▐▌  ▐▌▐▌ ▐▌  ▐▌    ▐▌   ▗▞▘  
      ▐▌ ▐▌▐▙▄▞▘▝▚▄▄▖▐▙▄▄▀▐▙▄▄▖▐▌   ▝▚▄▞▘▐▌ ▐▌▗▄█▄▖▗▄▄▞▘▐▌ ▐▌▐▙▄▄▖▐▌  ▐▌▐▌  ▐▌▝▚▄▞▘▐▌   ▐▙▄▟▙▖▐▌ ▐▌▗▄▄▞▘  █  ▝▚▄▞▘ ▝▚▞▘ ▐▙█▟▌▗▞▘▝▚▖  ▐▌  ▐▙▄▄▄▖
      """,
    // 5 = normal, 6 = wide
    //            ABCDEFGHIJKLMNOPQRSTUVWXYZ
    //                        **  *    * ***
    // M, N, Q, V, X, Y, Z are wide
    characterWidths: Array("55555555555566556555565666").compactMap { $0.wholeNumberValue }
  )
  
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
