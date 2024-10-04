pragma solidity ^0.8.20;

import {console2} from "forge-std/console2.sol";
import {Test} from "forge-std/Test.sol";
import {StdCheatsSafe} from "forge-std/StdCheats.sol";

contract MyContractTest is Test {
    function decode_tuple() internal returns (bytes memory a, bytes memory b) {
        string[] memory imageRunnerInput = new string[](5);
        uint256 i = 0;
        imageRunnerInput[i++] = "cargo";
        imageRunnerInput[i++] = "run";
        imageRunnerInput[i++] = "--bin";
        imageRunnerInput[i++] = "tuple";
        imageRunnerInput[i++] = "-q";
        (a, b) = abi.decode(vm.ffi(imageRunnerInput), (bytes, bytes));
        return (a, b);
    }

    struct AB {
        bytes a;
        bytes b;
    }

    function decode_struct() internal returns (bytes memory a, bytes memory b) {
        string[] memory imageRunnerInput = new string[](5);
        uint256 i = 0;
        imageRunnerInput[i++] = "cargo";
        imageRunnerInput[i++] = "run";
        imageRunnerInput[i++] = "--bin";
        imageRunnerInput[i++] = "struct";
        imageRunnerInput[i++] = "-q";
        AB memory ab = abi.decode(vm.ffi(imageRunnerInput), (AB));
        return (ab.a, ab.b);
    }

    function setUp() public {}

    function test_decode_tuple() public {
        (bytes memory a, bytes memory b) = decode_tuple();
        assertEq(bytes("hello"), a);
        assertEq(bytes("world"), b);
    }

    function test_decode_struct() public {
        (bytes memory a, bytes memory b) = decode_struct();
        assertEq(bytes("hello"), a);
        assertEq(bytes("world"), b);
    }
}
