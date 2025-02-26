//
//  chunk.swift
//  compiler
//
//  Created by Matthew Reed on 2/25/25.
//

struct Chunk {
    private(set) var code = [OpCode]()
    
    mutating func writeChunk(byte: OpCode) {
        code.append(byte)
    }
}

//MARK: Debugging
extension Chunk {
    func disassemble(name: String) {
        print("== \(name) ==")
        
        var offset = 0
        while offset < code.count {
            let op = code[offset]
            print("\(offset)", terminator: " ")
            offset = op.disassemble(offset: offset)
        }
    }
}
