//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable{
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't sent enough"); //1e18 == 1 * 10 ** 18 == 1000000000000000000 == 1eth
        
    }

    function getPrice() public view returns (uint256) {
        //interecting with outside the contract we need 1) ABI 2) Address
        //
        //0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int price,,,) = priceFeed.latestRoundData();
        //Eth price in terms of USD
        return uint256 (price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    //function withdraw(){}
}
