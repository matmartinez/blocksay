import Testing
@testable import blocksay

struct blocksayTests {
  
  @Test func testDefaultTransformRendersSingleLetter() async throws {
    let transform = BlockyTransform()
    let output = "a".applyingBlockyTransform(transform)
    let outputLines = output.split(separator: "\n", omittingEmptySubsequences: false)
    let fontLines = transform.font.ascii.split(separator: "\n", omittingEmptySubsequences: false)
    
    #expect(outputLines.count == fontLines.count)
    
    let expectedWidth = transform.font.characterWidths[0]
    let expectedSpacing = String(repeating: " ", count: transform.letterSpacing)

    for lineIndex in 0..<fontLines.count {
      let expectedPrefix = String(fontLines[lineIndex].prefix(expectedWidth))
      let expectedLine = expectedPrefix + expectedSpacing
      
      #expect(String(outputLines[lineIndex]) == expectedLine)
    }
  }
  
}
