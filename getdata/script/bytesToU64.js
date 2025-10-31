export function bytesToUint64(bytes) {
    // 创建一个 ArrayBuffer，大小为 8 字节（64 位）
    let buffer = new ArrayBuffer(8);
    // 创建一个 DataView，允许我们以不同的字节序访问 ArrayBuffer
    let view = new DataView(buffer);

    // 将字节数组写入 DataView
    bytes.forEach((byte, index) => {
        view.setUint8(index, byte);
    });

    const numberValue = Number(view.getBigUint64(0, true));


    // 以小端序读取 64 位无符号整数
    return numberValue;
}

