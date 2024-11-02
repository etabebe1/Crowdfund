// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {PriceConvertor} from "PriceConvertor.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract CrowdFund {
    using PriceConvertor for int256;

    // address priceFeedAdress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
    int256 minAmount = 5;

    function fund() public payable {
        require(
            int(msg.value).getConversionRate() > minAmount,
            "Minimum amount to send is 5"
        );
    }

    function withdarw() public {}
}
