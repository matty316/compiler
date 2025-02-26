//
//  instruction.swift
//  compiler
//
//  Created by Matthew Reed on 2/25/25.
//

enum OpCode: UInt8 {
    case ret
    
    func disassemble(offset: Int) -> Int {
        switch self {
        case .ret:
            return simpleInstruction(name: "OP_RETURN", offset: offset)
        }
    }
    
    func simpleInstruction(name: String, offset: Int) -> Int {
        print(name)
        return offset + 1
    }
}
