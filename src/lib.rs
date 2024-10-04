#[cfg(test)]
mod tests {
    use alloy::{primitives::Bytes, sol_types::SolValue};

    #[test]
    fn abi_encoding_decoding() {
        let (a, b) = (Bytes::from("hello"), Bytes::from("world"));
        let encoded = SolValue::abi_encode(&(a, b));

        let decoded: (Bytes, Bytes) = SolValue::abi_decode(&encoded, true).unwrap();

        assert_eq!(Bytes::from("hello"), decoded.0);
        assert_eq!(Bytes::from("world"), decoded.1);
    }
}
