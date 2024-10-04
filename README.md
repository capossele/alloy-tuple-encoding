# alloy ABI encoding/decoding

There seems to be a strange behavior when encoding in rust using the alloy crate
a tuple, the Solidity abi_decode does not match.
To test this hypothesis we wrote two tests:
1. Decoding a tuple as (bytes, bytes)
2. Decoding a struct as {bytes a; bytes b}

## Run tests

```console
forge test
```




