#[test_only]
module sui_mover_lesson_1::test2 {

    use std::debug;
    use std::type_name;
    use sui_mover_lesson_1::lesson_1;
    use std::string::{String, utf8};

    #[test]
    fun test_number() {
        let a = 99;
        let b = 100;
        let mst:u64 = lesson_1::test_leavel(a,b);
        debug::print(&mst);

        assert!(a * b == mst);
    }

    #[test]
    fun test_number2(){
        let a = 10;
        let b = 20;
        let mst:u64 = lesson_1::test_leavel(a,b);
        let sum:u64 = lesson_1::test_leavel(mst,mst);
        debug::print(&sum);
    }

   
}
