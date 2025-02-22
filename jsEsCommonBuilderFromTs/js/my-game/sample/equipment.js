"use strict";
// automatically generated by the FlatBuffers compiler, do not modify
Object.defineProperty(exports, "__esModule", { value: true });
exports.unionListToEquipment = exports.unionToEquipment = exports.Equipment = void 0;
/* eslint-disable @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any, @typescript-eslint/no-non-null-assertion */
const weapon_js_1 = require("../../my-game/sample/weapon.js");
var Equipment;
(function (Equipment) {
    Equipment[Equipment["NONE"] = 0] = "NONE";
    Equipment[Equipment["Weapon"] = 1] = "Weapon";
})(Equipment || (exports.Equipment = Equipment = {}));
function unionToEquipment(type, accessor) {
    switch (Equipment[type]) {
        case 'NONE': return null;
        case 'Weapon': return accessor(new weapon_js_1.Weapon());
        default: return null;
    }
}
exports.unionToEquipment = unionToEquipment;
function unionListToEquipment(type, accessor, index) {
    switch (Equipment[type]) {
        case 'NONE': return null;
        case 'Weapon': return accessor(index, new weapon_js_1.Weapon());
        default: return null;
    }
}
exports.unionListToEquipment = unionListToEquipment;
