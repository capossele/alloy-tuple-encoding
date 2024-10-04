use alloy::{primitives::Bytes, sol_types::SolValue};

alloy::sol!(
    struct AB {
        bytes a;
        bytes b;
    }
);

fn main() {
    let (a, b) = (Bytes::from("hello"), Bytes::from("world"));
    let output = SolValue::abi_encode(&AB { a, b });

    print!("{}", hex::encode(output));
}
