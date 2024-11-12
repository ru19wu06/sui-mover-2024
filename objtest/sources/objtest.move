module newproject::demo{
    // 引入 library
    use sui::object::{UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // 定義 Sword struct （Object）
    public struct Sword has key, store{
        id: UID,
        power: u64,
    }

    // 定義 Armor struct （Object）
    public struct Armor has key, store{
        id: UID,
        defense: u64,
    }
    
    // 定義 Person struct （Object）
    public struct Person has key{
        id: UID,
        isMan: bool,
        age: u8,
        sword: Sword, // Sword Object
        armor: Armor, // Armor Object
    }
    
    // 產生並取得Sword Object
    public entry fun create_sword(
        power: u64, 
        ctx: &mut TxContext,
    ){
        let sword = Sword{ // 實例化 Sword Object
            id: object::new(ctx),
            power: power,
        };
        // 將實例化的Sword Object的擁有者設定為呼叫此function的地址
        transfer::public_transfer(sword, tx_context::sender(ctx));
    }
    
    // 產生並取得Armor Object
    public entry fun create_armor(
        defense: u64, 
        ctx: &mut TxContext,
    ){
        let armor = Armor{ // 實例化 Armor Object
            id: object::new(ctx),
            defense: defense,
        };
        // 將實例化的Armor Object的擁有者設定為呼叫此function的地址
        transfer::public_transfer(armor, tx_context::sender(ctx));
    }
    
    // 產生並取得Person Object, 
    // 與此funtion互動前，要修透過上面兩個function取得Sword與Armor Object
    public entry fun create_person_and_wear_equipments(
        is_man: bool, 
        age: u8, 
        owned_sword: Sword, 
        owned_armor: Armor,
        ctx: &mut TxContext,
    ){
        let person = Person{ // 實例化 Person Object
            id: object::new(ctx),
            isMan: is_man,
            age: age,
            sword: owned_sword, // 將擁有的Sword object放進來當作Person Object的屬性
            armor: owned_armor, // 將擁有的Armor object放進來當作Person Object的屬性
        };
        // 將實例化的Person Object的擁有者設定為呼叫此function的地址
        transfer::transfer(person, tx_context::sender(ctx));
    }
    // 更換Person的Sword Object 
    public entry fun replaceSword(
        person: Person,
        new_sword: Sword,
        ctx: &mut TxContext,
    ){
        // 解包Person Object，解包後Person Object就不存在了
        let Person{
            id: person_id, // 用person_id變數去接Person Obejct解包得到的id內容值。
            isMan: person_is_man, // 用person_is_man變數去接Person Obejct解包得到的isMan內容值。
            age: person_age, // 用person_age變數去接Person Obejct解包得到的age內容值。
            sword: person_sword, // 用person_sword變數去接Person Obejct解包得到的Sword Object。
            armor: person_armor, // 用person_armor變數去接Person Obejct解包得到的Armor Object。
        } = person; // person解包的目標
        
        // 告知SUI Network將此person_id刪除。
        // 這邊也順帶提醒，這就是為什麼前面說object沒有drop能力，需要透過特殊處理，將它移除！
        object::delete(person_id);
        
        // 解包Person後，我們拿到了兩個尚未指派Object種類的Object：persson_sword, person_armor
        // 輸入帶進了新的new_sword，當Object丟進來function，他將不屬於任何種類，所以也要處理！
        // 接下來要來處理他們：
        
        // 將新的new_sword和舊的Person資訊組成新的Person Object發給function互動者
        let new_person = Person{
            id: object::new(ctx),
            isMan: person_is_man,
            age: person_age,
            sword: new_sword,
            armor: person_armor
        };
        
        //現在我們處理了舊的person_armor、以及新的new_sword，但同時也多了新的new_person。
        // 目前剩下new_person與舊的person_sword尚未設定種類，其餘(person_armor與new_sword)被打包進new_person，故不需要設定種類
        
        // 將舊得person_sword設定為owned object，owner用function互動者
        transfer::public_transfer(person_sword, tx_context::sender(ctx));

        // 將new_person設定為owned object，owner用function互動者
        transfer::transfer(new_person, tx_context::sender(ctx));

        // 這樣所有object要碼在其他object中，要碼有設定種類了，如此編譯就會過了！ 
    }
    // Armor Object
    public entry fun replaceArmor(
        person: Person,
        new_armor: Armor,
        ctx: &mut TxContext,
    ){
        // 解包Person Object，解包後Person Object就不存在了
        let Person{
            id: person_id, // 用person_id變數去接Person Obejct解包得到的id內容值。
            isMan: person_is_man, // 用person_is_man變數去接Person Obejct解包得到的isMan內容值。
            age: person_age, // 用person_age變數去接Person Obejct解包得到的age內容值。
            sword: person_sword, // 用person_sword變數去接Person Obejct解包得到的Sword Object。
            armor: person_armor, // 用person_armor變數去接Person Obejct解包得到的Armor Object。
        } = person; // person解包的目標
        
        // 告知SUI Network將此person_id刪除。
        // 這邊也順帶提醒，這就是為什麼前面說object沒有drop能力，需要透過特殊處理，將它移除！
        object::delete(person_id);
        
        // 解包Person後，我們拿到了兩個尚未指派Object種類的Object：persson_sword, person_armor
        // 輸入帶進了新的new_armor，當Object丟進來function，他將不屬於任何種類，所以也要處理！
        // 接下來要來處理他們：
        
        // 將新的new_armor和舊的Person資訊組成新的Person Object發給function互動者
        let new_person = Person{
            id: object::new(ctx),
            isMan: person_is_man,
            age: person_age,
            sword: person_sword,
            armor: new_armor
        };
        
        //現在我們處理了舊的person_armor、以及新的new_armor，但同時也多了新的new_person。
        // 目前剩下new_person與舊的person_armor尚未設定種類，其餘(person_armor與new_sword)被打包進new_person，故不需要設定種類
        
        // 將舊的person_armor設定為owned object，owner用function互動者
        transfer::public_transfer(person_armor, tx_context::sender(ctx));

        // 將new_person設定為owned object，owner用function互動者
        transfer::transfer(new_person, tx_context::sender(ctx));

        // 這樣所有object要碼在其他object中，要碼有設定種類了，如此編譯就會過了！ 
    }

    // 解包所有的object，將其全部刪除
    public entry fun unwrapAndDeleteAllObject(
        person: Person,
        ctx: &mut TxContext,
    ){
        // 解包 Persion Object
        let Person{
            id: person_id,
            isMan: _, // 忽略不取，而由於此參數資料型態為bool (store, drop , copy)，因為有drop，function運行完會移除，不需特別處理！
            age: _, // 忽略不取，而由於此參數資料型態為bool (store, drop , copy)，因為有drop，function運行完會移除，不需特別處理！
            sword: person_sword,
            armor: person_armor,
        } = person;
        
        // 解包從Persion Object取出的person_sword
        let Sword{
            id: sword_id,
            power: _,
        }= person_sword;

        // 解包從Persion Object取出的person_armor
        let Armor{
            id: armor_id,
            defense: _,
        }= person_armor;
        
        // 將解包的Object Id全部刪除
        object::delete(person_id);
        object::delete(sword_id);
        object::delete(armor_id);
    }

}