//SPDX-LICENCE-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);    
    }
}
