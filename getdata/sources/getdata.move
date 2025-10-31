module example::QueryData {
    //use sui::object::{Object};

    public fun get_balance(): u64 {
        return 666666 // 假設 object 內部有 balance 欄位
    }

    public fun get_balance2(number:u64): u64 {
        return number * 5 // 假設 object 內部有 balance 欄位
    }
}
