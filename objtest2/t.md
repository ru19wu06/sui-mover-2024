sui client call --package 0x8337652e2ab7ac589e64f82fb2841c8d8047fa62c36064e297a6e7b229e4728d --module demo --function create_armor --args 55 --gas-budget 30000000

sui client call --package 0x8337652e2ab7ac589e64f82fb2841c8d8047fa62c36064e297a6e7b229e4728d --module demo --function create_sword --args 55 --gas-budget 30000000

sui client call --package 0x8337652e2ab7ac589e64f82fb2841c8d8047fa62c36064e297a6e7b229e4728d --module demo --function create_person_and_wear_equipments --args true 55 0x0e6abfdfada033b448812564b21b5b9f36e62219c0a5f80b4a7fd1a860bf1fea 0x80cfdf00a764ae9b26a8abc5beb714aed2a2333089f7fb3634153d7a5452f2cf  --gas-budget 30000000


sui client upgrade --gas-budget 30000000 --upgrade-capability 0x6087784c30f7da4e8374f943725bdda3d7b37b5cd097434c87cb16863f1f4c2f


sui client upgrade --upgrade-capability 0x6087784c30f7da4e8374f943725bdda3d7b37b5cd097434c87cb16863f1f4c2f --gas-budget 30000000 D:\sui-mover-2024\objtest\sources\objtest.move