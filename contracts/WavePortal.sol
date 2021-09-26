pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 waveCount;
    uint256 private seed;
    event NewWave(address indexed from, uint256 timestamp, string message);

    mapping(address => uint256) public lastWavedAt;

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() payable {
        console.log("Yo yo, Very first smart contract from GrandZero !!");
    }

    function wave(string memory _message) public {
        require(
            lastWavedAt[msg.sender] + 15 minutes < block.timestamp,
            "Wait 15m"
        );

        lastWavedAt[msg.sender] = block.timestamp;

        waveCount += 1;
        console.log("%s is waved!", msg.sender);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        uint256 randomNumber = (block.difficulty + block.timestamp + seed) %
            100;
        emit NewWave(msg.sender, block.timestamp, _message);

        seed = randomNumber;

        if (randomNumber < 50) {
            uint256 prizeAmount = 0.0001 ether;
            require(
                prizeAmount <= address(this).balance,
                "Trying to withdraw more money than the conract has."
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(success, "Failed to withdraw money from contract");
        }
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves", waveCount);
        return waveCount;
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }
}
