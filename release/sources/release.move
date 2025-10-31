module release::demo2{
    use sui::object::{UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // 定義 Sword struct （Object）
    public struct Sword has{
        id: UID,
        power: u64,
    }

    // 定義 Armor struct （Object）
    public struct Armor has key, store, drop{
        id: UID
        defense: u64,
    }

     // 定義 Person struct （Object）
    public struct Person has key, drop{
        id: UID,
        isMan: bool,
        age: u8,
        sword: Sword, // Sword Object
        armor: Armor, // Armor Object
    }


    // 釋放 Sword 對象
    public entry fun release_sword(
        sword: Sword,
        ctx: &mut TxContext,
    ){
        // 透過消耗 Sword 對象來釋放它
        // 不需要做任何操作，僅消耗它即可
    }

    // 釋放 Armor 對象
    public entry fun release_armor(
        armor: Armor,
        ctx: &mut TxContext,
    ){
        // 透過消耗 Armor 對象來釋放它
        // 不需要做任何操作，僅消耗它即可
    }

    // 釋放 Person 對象
    public entry fun release_person(
        person: Person,
        ctx: &mut TxContext,
    ){
        // 透過消耗 Person 對象來釋放它
        // 不需要做任何操作，僅消耗它即可
    }

}