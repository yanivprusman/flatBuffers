// automatically generated by the FlatBuffers compiler, do not modify
/* eslint-disable @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any, @typescript-eslint/no-non-null-assertion */
import * as flatbuffers from 'flatbuffers';
export class MyTable {
    constructor() {
        this.bb = null;
        this.bb_pos = 0;
    }
    __init(i, bb) {
        this.bb_pos = i;
        this.bb = bb;
        return this;
    }
    static getRootAsMyTable(bb, obj) {
        return (obj || new MyTable()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
    }
    static getSizePrefixedRootAsMyTable(bb, obj) {
        bb.setPosition(bb.position() + flatbuffers.SIZE_PREFIX_LENGTH);
        return (obj || new MyTable()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
    }
    static bufferHasIdentifier(bb) {
        return bb.__has_identifier('MRD2');
    }
    myAta(optionalEncoding) {
        const offset = this.bb.__offset(this.bb_pos, 4);
        return offset ? this.bb.__string(this.bb_pos + offset, optionalEncoding) : null;
    }
    static startMyTable(builder) {
        builder.startObject(1);
    }
    static addMyAta(builder, myAtaOffset) {
        builder.addFieldOffset(0, myAtaOffset, 0);
    }
    static endMyTable(builder) {
        const offset = builder.endObject();
        return offset;
    }
    static finishMyTableBuffer(builder, offset) {
        builder.finish(offset, 'MRD2');
    }
    static finishSizePrefixedMyTableBuffer(builder, offset) {
        builder.finish(offset, 'MRD2', true);
    }
    static createMyTable(builder, myAtaOffset) {
        MyTable.startMyTable(builder);
        MyTable.addMyAta(builder, myAtaOffset);
        return MyTable.endMyTable(builder);
    }
}
