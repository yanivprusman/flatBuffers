import * as flatbuffers from 'flatbuffers';
import { Color } from '../../my-game/sample/color.js';
import { Equipment } from '../../my-game/sample/equipment.js';
import { Vec3 } from '../../my-game/sample/vec3.js';
import { Weapon } from '../../my-game/sample/weapon.js';
export declare class Monster {
    bb: flatbuffers.ByteBuffer | null;
    bb_pos: number;
    __init(i: number, bb: flatbuffers.ByteBuffer): Monster;
    static getRootAsMonster(bb: flatbuffers.ByteBuffer, obj?: Monster): Monster;
    static getSizePrefixedRootAsMonster(bb: flatbuffers.ByteBuffer, obj?: Monster): Monster;
    pos(obj?: Vec3): Vec3 | null;
    mana(): number;
    hp(): number;
    name(): string | null;
    name(optionalEncoding: flatbuffers.Encoding): string | Uint8Array | null;
    inventory(index: number): number | null;
    inventoryLength(): number;
    inventoryArray(): Uint8Array | null;
    color(): Color;
    weapons(index: number, obj?: Weapon): Weapon | null;
    weaponsLength(): number;
    equippedType(): Equipment;
    equipped<T extends flatbuffers.Table>(obj: any): any | null;
    path(index: number, obj?: Vec3): Vec3 | null;
    pathLength(): number;
    static startMonster(builder: flatbuffers.Builder): void;
    static addPos(builder: flatbuffers.Builder, posOffset: flatbuffers.Offset): void;
    static addMana(builder: flatbuffers.Builder, mana: number): void;
    static addHp(builder: flatbuffers.Builder, hp: number): void;
    static addName(builder: flatbuffers.Builder, nameOffset: flatbuffers.Offset): void;
    static addInventory(builder: flatbuffers.Builder, inventoryOffset: flatbuffers.Offset): void;
    static createInventoryVector(builder: flatbuffers.Builder, data: number[] | Uint8Array): flatbuffers.Offset;
    static startInventoryVector(builder: flatbuffers.Builder, numElems: number): void;
    static addColor(builder: flatbuffers.Builder, color: Color): void;
    static addWeapons(builder: flatbuffers.Builder, weaponsOffset: flatbuffers.Offset): void;
    static createWeaponsVector(builder: flatbuffers.Builder, data: flatbuffers.Offset[]): flatbuffers.Offset;
    static startWeaponsVector(builder: flatbuffers.Builder, numElems: number): void;
    static addEquippedType(builder: flatbuffers.Builder, equippedType: Equipment): void;
    static addEquipped(builder: flatbuffers.Builder, equippedOffset: flatbuffers.Offset): void;
    static addPath(builder: flatbuffers.Builder, pathOffset: flatbuffers.Offset): void;
    static startPathVector(builder: flatbuffers.Builder, numElems: number): void;
    static endMonster(builder: flatbuffers.Builder): flatbuffers.Offset;
    static finishMonsterBuffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static finishSizePrefixedMonsterBuffer(builder: flatbuffers.Builder, offset: flatbuffers.Offset): void;
    static createMonster(builder: flatbuffers.Builder, posOffset: flatbuffers.Offset, mana: number, hp: number, nameOffset: flatbuffers.Offset, inventoryOffset: flatbuffers.Offset, color: Color, weaponsOffset: flatbuffers.Offset, equippedType: Equipment, equippedOffset: flatbuffers.Offset, pathOffset: flatbuffers.Offset): flatbuffers.Offset;
}
//# sourceMappingURL=monster.d.ts.map