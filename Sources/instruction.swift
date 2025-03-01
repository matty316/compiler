//
//  instruction.swift
//  compiler
//
//  Created by Matthew Reed on 2/25/25.
//

enum OpCode: UInt8 {
    case ret, constant
    
    func disassemble(chunk: Chunk, offset: Int) -> Int {
        if offset > 0 && chunk.lines[offset] == chunk.lines[offset - 1] {
            print("|", terminator: " ")
        } else {
            print("\(chunk.lines[offset])", terminator: " ")
        }
        
        switch self {
        case .ret:
            return simpleInstruction(name: "OP_RETURN", offset: offset)
        case .constant:
            return constantInstruction(name: "OP_CONSTANT", chunk: chunk, offset: offset)
        }
    }
    
    func simpleInstruction(name: String, offset: Int) -> Int {
        print(name)
        return offset + 1
    }
    
    func constantInstruction(name: String, chunk: Chunk, offset: Int) -> Int {
        let constant = chunk.code[offset + 1]
        print("\(name) \(constant)", terminator: " ")
        print("\(chunk.constants[Int(constant)])")
        return offset + 2
    }
}
