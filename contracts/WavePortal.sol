pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 waveCount = 0;

    // struct Trade {
    //     uint256 tradeCount;
    //     string author;
    // }
    // Trade trade;

    constructor() {
        console.log("Yo yo, Very first smart contract !!");
        // trade = Trade(0, "GrandZero");
    }

    // function getCurrentTradeCount() public view returns (uint256) {
    //     console.log("%d trade count", trade.tradeCount);
    //     return trade.tradeCount;
    // }

    // function increaseTradeCount() public {
    //     trade.tradeCount += 1;
    // }

    // function getCurrentAuthor() public view returns (string memory) {
    //     console.log("%s author is : ", trade.author);
    //     return trade.author;
    // }

    function wave() public {
        ++waveCount;
        console.log("%s is waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves", waveCount);
        return waveCount;
    }
}
