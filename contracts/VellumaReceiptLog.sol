// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VellumaReceiptLog {
    mapping(address => uint256) public totalDepositedBy;
    uint256 public totalReceived;

    event Receipt(address indexed from, uint256 amount, string tag, uint256 indexed blockNumber);

    function deposit(string calldata tag) external payable {
        require(msg.value > 0, "No ETH sent");
        totalDepositedBy[msg.sender] += msg.value;
        totalReceived += msg.value;
        emit Receipt(msg.sender, msg.value, tag, block.number);
    }

    function vaultBalance() external view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {
        totalDepositedBy[msg.sender] += msg.value;
        totalReceived += msg.value;
        emit Receipt(msg.sender, msg.value, "receive()", block.number);
    }
}
