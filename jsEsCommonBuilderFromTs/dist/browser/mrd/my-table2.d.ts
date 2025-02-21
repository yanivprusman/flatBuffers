import * as flatbuffers from 'flatbuffers';
export declare class MyTable2 {
    bb: flatbuffers.ByteBuffer | null;
    bb_pos: number;
    __init(i: number, bb: flatbuffers.ByteBuffer): MyTable2;
    static getRootAsMyTable2(bb: flatbuffers.ByteBuffer, obj?: MyTable2): MyTable2;
    static getSizePrefixedRootAsMyTable2(bb: flatbuffers.ByteBuffer, obj?: MyTable2): MyTable2;
    static bufferHasIdentifier(bb: flatbuffers.ByteBuffer): boolean;
    myAta(): string | null;
    myAta(optionalEncoding: flatbuffers.Encoding): string | Uint8Array | null;
    static startMyTable2(builder: flatbuffers.Builder): void;
    static addMyAta(builder: flatbuffers.Builder, myAtaOffset: flatbuffers.Offset): void;
    static endMyTable2(builder: flatbuffers.Builder): flatbuffers.Offset;
    static finishMyTable2Buffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static finishSizePrefixedMyTable2Buffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static createMyTable2(builder: flatbuffers.Builder, myAtaOffset: flatbuffers.Offset): flatbuffers.Offset;
}
