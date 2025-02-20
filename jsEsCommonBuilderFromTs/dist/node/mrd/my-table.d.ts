import * as flatbuffers from 'flatbuffers';
export declare class MyTable {
    bb: flatbuffers.ByteBuffer | null;
    bb_pos: number;
    __init(i: number, bb: flatbuffers.ByteBuffer): MyTable;
    static getRootAsMyTable(bb: flatbuffers.ByteBuffer, obj?: MyTable): MyTable;
    static getSizePrefixedRootAsMyTable(bb: flatbuffers.ByteBuffer, obj?: MyTable): MyTable;
    static bufferHasIdentifier(bb: flatbuffers.ByteBuffer): boolean;
    myAta(): string | null;
    myAta(optionalEncoding: flatbuffers.Encoding): string | Uint8Array | null;
    static startMyTable(builder: flatbuffers.Builder): void;
    static addMyAta(builder: flatbuffers.Builder, myAtaOffset: flatbuffers.Offset): void;
    static endMyTable(builder: flatbuffers.Builder): flatbuffers.Offset;
    static finishMyTableBuffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static finishSizePrefixedMyTableBuffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static createMyTable(builder: flatbuffers.Builder, myAtaOffset: flatbuffers.Offset): flatbuffers.Offset;
}
