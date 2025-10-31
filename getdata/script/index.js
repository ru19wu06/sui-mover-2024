import { SuiClient } from '@mysten/sui/client';
import { Transaction } from "@mysten/sui/transactions";
import { bytesToUint64 } from './bytesToU64.js'
// 替换为你的合约地址和函数名称

// 创建一个新的 SuiClient 对象，指向你想使用的网络
const suiClient = new SuiClient({ url: 'https://fullnode.devnet.sui.io' });

async function callContractFunction() {
    try {
        
        const tx = new Transaction();

        tx.moveCall({
            target: '0xa527021ed9bc4f362e299eabb7ce4f7b4670b1417500a13060269a817a013b94::QueryData::get_balance2',
            arguments:[tx.pure.u64(200)],
        });

        // 发送交易并获取结果
        const result = await suiClient.devInspectTransactionBlock({
            transactionBlock: tx,
            sender: '0xa527021ed9bc4f362e299eabb7ce4f7b4670b1417500a13060269a817a013b94',
        });

        console.log('Function Result:', result);

        const firstReturnValues = result.results?.[0].returnValues;
        console.log('undecode value',firstReturnValues[0][0])

        const trueValue = bytesToUint64(firstReturnValues[0][0]);

        console.log('true value :',trueValue)
    } catch (error) {
        console.error('Error calling contract function:', error);
    }
}

callContractFunction();
