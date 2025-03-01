//
//  compiler.swift
//  compiler
//
//  Created by Matthew Reed on 2/25/25.
//

@main
struct Compiler {
    static func main() {
        var chunk = Chunk()
        let constant = chunk.addConstant(1.2)
        
        chunk.write(OpCode.constant.rawValue, line: 123)
        chunk.write(constant, line: 123)
        
        chunk.write(OpCode.ret.rawValue, line: 123)
        
        chunk.disassemble(name: "test chunk")
    }
}
