import * as flatbuffers from 'flatbuffers';
import { types } from '../mrd/types.js';
export declare class MyTable2 {
    bb: flatbuffers.ByteBuffer | null;
    bb_pos: number;
    __init(i: number, bb: flatbuffers.ByteBuffer): MyTable2;
    static getRootAsMyTable2(bb: flatbuffers.ByteBuffer, obj?: MyTable2): MyTable2;
    static getSizePrefixedRootAsMyTable2(bb: flatbuffers.ByteBuffer, obj?: MyTable2): MyTable2;
    static bufferHasIdentifier(bb: flatbuffers.ByteBuffer): boolean;
    myData2(): string | null;
    myData2(optionalEncoding: flatbuffers.Encoding): string | Uint8Array | null;
    myEnum2(): types;
    static startMyTable2(builder: flatbuffers.Builder): void;
    static addMyData2(builder: flatbuffers.Builder, myData2Offset: flatbuffers.Offset): void;
    static addMyEnum2(builder: flatbuffers.Builder, myEnum2: types): void;
    static endMyTable2(builder: flatbuffers.Builder): flatbuffers.Offset;
    static finishMyTable2Buffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static finishSizePrefixedMyTable2Buffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static createMyTable2(builder: flatbuffers.Builder, myData2Offset: flatbuffers.Offset, myEnum2: types): flatbuffers.Offset;
}
