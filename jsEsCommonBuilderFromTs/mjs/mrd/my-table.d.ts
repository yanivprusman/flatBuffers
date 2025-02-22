import * as flatbuffers from 'flatbuffers';
import { types } from '../mrd/types.js';
export declare class MyTable {
    bb: flatbuffers.ByteBuffer | null;
    bb_pos: number;
    __init(i: number, bb: flatbuffers.ByteBuffer): MyTable;
    static getRootAsMyTable(bb: flatbuffers.ByteBuffer, obj?: MyTable): MyTable;
    static getSizePrefixedRootAsMyTable(bb: flatbuffers.ByteBuffer, obj?: MyTable): MyTable;
    static bufferHasIdentifier(bb: flatbuffers.ByteBuffer): boolean;
    myData1(): string | null;
    myData1(optionalEncoding: flatbuffers.Encoding): string | Uint8Array | null;
    myEnum1(): types;
    static startMyTable(builder: flatbuffers.Builder): void;
    static addMyData1(builder: flatbuffers.Builder, myData1Offset: flatbuffers.Offset): void;
    static addMyEnum1(builder: flatbuffers.Builder, myEnum1: types): void;
    static endMyTable(builder: flatbuffers.Builder): flatbuffers.Offset;
    static finishMyTableBuffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static finishSizePrefixedMyTableBuffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static createMyTable(builder: flatbuffers.Builder, myData1Offset: flatbuffers.Offset, myEnum1: types): flatbuffers.Offset;
}
