// automatically generated by the FlatBuffers compiler, do not modify

/* eslint-disable @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any, @typescript-eslint/no-non-null-assertion */

import * as flatbuffers from 'flatbuffers';

import { Color } from '../../my-game/sample/color.js';
import { Equipment, unionToEquipment, unionListToEquipment } from '../../my-game/sample/equipment.js';
import { Vec3 } from '../../my-game/sample/vec3.js';
import { Weapon } from '../../my-game/sample/weapon.js';


export class Monster {
  bb: flatbuffers.ByteBuffer|null = null;
  bb_pos = 0;
  __init(i:number, bb:flatbuffers.ByteBuffer):Monster {
  this.bb_pos = i;
  this.bb = bb;
  return this;
}

static getRootAsMonster(bb:flatbuffers.ByteBuffer, obj?:Monster):Monster {
  return (obj || new Monster()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
}

static getSizePrefixedRootAsMonster(bb:flatbuffers.ByteBuffer, obj?:Monster):Monster {
  bb.setPosition(bb.position() + flatbuffers.SIZE_PREFIX_LENGTH);
  return (obj || new Monster()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
}

pos(obj?:Vec3):Vec3|null {
  const offset = this.bb!.__offset(this.bb_pos, 4);
  return offset ? (obj || new Vec3()).__init(this.bb_pos + offset, this.bb!) : null;
}

mana():number {
  const offset = this.bb!.__offset(this.bb_pos, 6);
  return offset ? this.bb!.readInt16(this.bb_pos + offset) : 150;
}

hp():number {
  const offset = this.bb!.__offset(this.bb_pos, 8);
  return offset ? this.bb!.readInt16(this.bb_pos + offset) : 100;
}

name():string|null
name(optionalEncoding:flatbuffers.Encoding):string|Uint8Array|null
name(optionalEncoding?:any):string|Uint8Array|null {
  const offset = this.bb!.__offset(this.bb_pos, 10);
  return offset ? this.bb!.__string(this.bb_pos + offset, optionalEncoding) : null;
}

inventory(index: number):number|null {
  const offset = this.bb!.__offset(this.bb_pos, 14);
  return offset ? this.bb!.readUint8(this.bb!.__vector(this.bb_pos + offset) + index) : 0;
}

inventoryLength():number {
  const offset = this.bb!.__offset(this.bb_pos, 14);
  return offset ? this.bb!.__vector_len(this.bb_pos + offset) : 0;
}

inventoryArray():Uint8Array|null {
  const offset = this.bb!.__offset(this.bb_pos, 14);
  return offset ? new Uint8Array(this.bb!.bytes().buffer, this.bb!.bytes().byteOffset + this.bb!.__vector(this.bb_pos + offset), this.bb!.__vector_len(this.bb_pos + offset)) : null;
}

color():Color {
  const offset = this.bb!.__offset(this.bb_pos, 16);
  return offset ? this.bb!.readInt8(this.bb_pos + offset) : Color.Blue;
}

weapons(index: number, obj?:Weapon):Weapon|null {
  const offset = this.bb!.__offset(this.bb_pos, 18);
  return offset ? (obj || new Weapon()).__init(this.bb!.__indirect(this.bb!.__vector(this.bb_pos + offset) + index * 4), this.bb!) : null;
}

weaponsLength():number {
  const offset = this.bb!.__offset(this.bb_pos, 18);
  return offset ? this.bb!.__vector_len(this.bb_pos + offset) : 0;
}

equippedType():Equipment {
  const offset = this.bb!.__offset(this.bb_pos, 20);
  return offset ? this.bb!.readUint8(this.bb_pos + offset) : Equipment.NONE;
}

equipped<T extends flatbuffers.Table>(obj:any):any|null {
  const offset = this.bb!.__offset(this.bb_pos, 22);
  return offset ? this.bb!.__union(obj, this.bb_pos + offset) : null;
}

path(index: number, obj?:Vec3):Vec3|null {
  const offset = this.bb!.__offset(this.bb_pos, 24);
  return offset ? (obj || new Vec3()).__init(this.bb!.__vector(this.bb_pos + offset) + index * 12, this.bb!) : null;
}

pathLength():number {
  const offset = this.bb!.__offset(this.bb_pos, 24);
  return offset ? this.bb!.__vector_len(this.bb_pos + offset) : 0;
}

static startMonster(builder:flatbuffers.Builder) {
  builder.startObject(11);
}

static addPos(builder:flatbuffers.Builder, posOffset:flatbuffers.Offset) {
  builder.addFieldStruct(0, posOffset, 0);
}

static addMana(builder:flatbuffers.Builder, mana:number) {
  builder.addFieldInt16(1, mana, 150);
}

static addHp(builder:flatbuffers.Builder, hp:number) {
  builder.addFieldInt16(2, hp, 100);
}

static addName(builder:flatbuffers.Builder, nameOffset:flatbuffers.Offset) {
  builder.addFieldOffset(3, nameOffset, 0);
}

static addInventory(builder:flatbuffers.Builder, inventoryOffset:flatbuffers.Offset) {
  builder.addFieldOffset(5, inventoryOffset, 0);
}

static createInventoryVector(builder:flatbuffers.Builder, data:number[]|Uint8Array):flatbuffers.Offset {
  builder.startVector(1, data.length, 1);
  for (let i = data.length - 1; i >= 0; i--) {
    builder.addInt8(data[i]!);
  }
  return builder.endVector();
}

static startInventoryVector(builder:flatbuffers.Builder, numElems:number) {
  builder.startVector(1, numElems, 1);
}

static addColor(builder:flatbuffers.Builder, color:Color) {
  builder.addFieldInt8(6, color, Color.Blue);
}

static addWeapons(builder:flatbuffers.Builder, weaponsOffset:flatbuffers.Offset) {
  builder.addFieldOffset(7, weaponsOffset, 0);
}

static createWeaponsVector(builder:flatbuffers.Builder, data:flatbuffers.Offset[]):flatbuffers.Offset {
  builder.startVector(4, data.length, 4);
  for (let i = data.length - 1; i >= 0; i--) {
    builder.addOffset(data[i]!);
  }
  return builder.endVector();
}

static startWeaponsVector(builder:flatbuffers.Builder, numElems:number) {
  builder.startVector(4, numElems, 4);
}

static addEquippedType(builder:flatbuffers.Builder, equippedType:Equipment) {
  builder.addFieldInt8(8, equippedType, Equipment.NONE);
}

static addEquipped(builder:flatbuffers.Builder, equippedOffset:flatbuffers.Offset) {
  builder.addFieldOffset(9, equippedOffset, 0);
}

static addPath(builder:flatbuffers.Builder, pathOffset:flatbuffers.Offset) {
  builder.addFieldOffset(10, pathOffset, 0);
}

static startPathVector(builder:flatbuffers.Builder, numElems:number) {
  builder.startVector(12, numElems, 4);
}

static endMonster(builder:flatbuffers.Builder):flatbuffers.Offset {
  const offset = builder.endObject();
  return offset;
}

static finishMonsterBuffer(builder:flatbuffers.Builder, offset:flatbuffers.Offset) {
  builder.finish(offset);
}

static finishSizePrefixedMonsterBuffer(builder:flatbuffers.Builder, offset:flatbuffers.Offset) {
  builder.finish(offset, undefined, true);
}

static createMonster(builder:flatbuffers.Builder, posOffset:flatbuffers.Offset, mana:number, hp:number, nameOffset:flatbuffers.Offset, inventoryOffset:flatbuffers.Offset, color:Color, weaponsOffset:flatbuffers.Offset, equippedType:Equipment, equippedOffset:flatbuffers.Offset, pathOffset:flatbuffers.Offset):flatbuffers.Offset {
  Monster.startMonster(builder);
  Monster.addPos(builder, posOffset);
  Monster.addMana(builder, mana);
  Monster.addHp(builder, hp);
  Monster.addName(builder, nameOffset);
  Monster.addInventory(builder, inventoryOffset);
  Monster.addColor(builder, color);
  Monster.addWeapons(builder, weaponsOffset);
  Monster.addEquippedType(builder, equippedType);
  Monster.addEquipped(builder, equippedOffset);
  Monster.addPath(builder, pathOffset);
  return Monster.endMonster(builder);
}
}
