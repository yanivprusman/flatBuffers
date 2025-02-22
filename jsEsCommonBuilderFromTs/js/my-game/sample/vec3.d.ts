import * as flatbuffers from 'flatbuffers';
export declare class Vec3 {
    bb: flatbuffers.ByteBuffer | null;
    bb_pos: number;
    __init(i: number, bb: flatbuffers.ByteBuffer): Vec3;
    x(): number;
    y(): number;
    z(): number;
    static sizeOf(): number;
    static createVec3(builder: flatbuffers.Builder, x: number, y: number, z: number): flatbuffers.Offset;
}
