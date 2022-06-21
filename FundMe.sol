//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe{

uint256 public minimumUsd = 50;

    function fund() public payable{
        require(msg.value >= 1e18, "Didn't sent enough"); //1e18 == 1 * 10 ** 18 == 1000000000000000000 == 1eth 
    }
}
