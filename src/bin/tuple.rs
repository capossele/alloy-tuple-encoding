use alloy::{primitives::Bytes, sol_types::SolValue};

fn main() {
    let (a, b) = (Bytes::from("hello"), Bytes::from("world"));
    let output = SolValue::abi_encode(&(a, b));

    print!("{}", hex::encode(output));
}
