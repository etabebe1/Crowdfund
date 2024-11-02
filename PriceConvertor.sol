// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// // importing AggregatorV3Interface contract instead copying the entier contract it's self
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConvertor {
    function getEthPrice() public view returns (int256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return (answer * 1e10);
    }

    function getConversionRate(int minValue) public view returns (int) {
        int currentEthPrice = getEthPrice();
        int ethAmount = (currentEthPrice * minValue)/1e18;
        return ethAmount; 
    }

    function getVersion () public view returns (uint) {
     return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version(); 
    }
}