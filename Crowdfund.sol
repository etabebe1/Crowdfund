// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// importing AggregatorV3Interface contract instead copying the entier contract it's self 
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// // With contract
// // user can send funds
// // owner can withdraw fund
contract CrowdFund {
    address priceFeedAdress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
    uint256 minAmount = 5;

    function fund() public payable {
        require(msg.value > 1e18, "Minimum amount to send is 5");
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(priceFeedAdress).version();
    }

    function getEthPrice() public view returns (int256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            priceFeedAdress
        );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return answer;
    }

    function withdraw () public {

    }
}
