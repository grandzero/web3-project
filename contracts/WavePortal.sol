pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 waveCount = 0;

    constructor() {
        console.log("Yo yo, Very first smart contract !!");
    }

    function wave() public {
        ++waveCount;
        console.log("%s is waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves", waveCount);
        return waveCount;
    }
}
