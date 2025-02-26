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
        chunk.writeChunk(byte: .ret)
        chunk.disassemble(name: "test chunk")
    }
}
