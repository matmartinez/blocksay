//
//  BlockyFont.swift
//  blocksay
//
//  Created by Matías Martínez on 15/1/26.
//

struct BlockyFont {
  var ascii: String
  var characterWidths: [Int]
  var cummulativeCharacterOffsets: [Int] {
    var offsets: [Int] = []
    offsets.reserveCapacity(26)

    var currentOffset = 0
    for width in characterWidths {
      offsets.append(currentOffset)
      currentOffset += width
    }

    return offsets
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
