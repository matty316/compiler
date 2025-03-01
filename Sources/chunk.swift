//
//  chunk.swift
//  compiler
//
//  Created by Matthew Reed on 2/25/25.
//

struct Chunk {
    private(set) var code = [UInt8]()
    private(set) var lines = [Int]()
    private(set) var constants = [Value]()
    
    mutating func write(_ byte: UInt8, line: Int) {
        code.append(byte)
        lines.append(line)
    }
    
    mutating func addConstant(_ constant: Value) -> UInt8 {
        constants.append(constant)
        return UInt8(constants.count - 1)
    }
}

//MARK: Debugging
extension Chunk {
    func disassemble(name: String) {
        print("== \(name) ==")
        
        var offset = 0
        while offset < code.count {
            if let op = OpCode(rawValue: code[offset]) {
                print("\(offset)", terminator: " ")
                offset = op.disassemble(chunk: self, offset: offset)
            }
        }
    }
}
