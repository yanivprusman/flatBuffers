import { Weapon } from '../../my-game/sample/weapon.js';
export declare enum Equipment {
    NONE = 0,
    Weapon = 1
}
export declare function unionToEquipment(type: Equipment, accessor: (obj: Weapon) => Weapon | null): Weapon | null;
export declare function unionListToEquipment(type: Equipment, accessor: (index: number, obj: Weapon) => Weapon | null, index: number): Weapon | null;
//# sourceMappingURL=equipment.d.ts.map