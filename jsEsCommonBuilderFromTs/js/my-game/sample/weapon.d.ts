import * as flatbuffers from 'flatbuffers';
export declare class Weapon {
    bb: flatbuffers.ByteBuffer | null;
    bb_pos: number;
    __init(i: number, bb: flatbuffers.ByteBuffer): Weapon;
    static getRootAsWeapon(bb: flatbuffers.ByteBuffer, obj?: Weapon): Weapon;
    static getSizePrefixedRootAsWeapon(bb: flatbuffers.ByteBuffer, obj?: Weapon): Weapon;
    name(): string | null;
    name(optionalEncoding: flatbuffers.Encoding): string | Uint8Array | null;
    damage(): number;
    static startWeapon(builder: flatbuffers.Builder): void;
    static addName(builder: flatbuffers.Builder, nameOffset: flatbuffers.Offset): void;
    static addDamage(builder: flatbuffers.Builder, damage: number): void;
    static endWeapon(builder: flatbuffers.Builder): flatbuffers.Offset;
    static createWeapon(builder: flatbuffers.Builder, nameOffset: flatbuffers.Offset, damage: number): flatbuffers.Offset;
}
