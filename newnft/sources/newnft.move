/*
/// Module: newnft
module newnft::newnft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module newnft::newnft{

    use sui::vec_set::{Self, VecSet};

    const EThisIsAError:string = 'ERROR!';
    fun err_carry_a_error(){abort EThisIsAError}

    public struct NEWNFT has drop{}

    public struct Newnft has key, store{
        id:UID,
        index:u64,

    }
}
