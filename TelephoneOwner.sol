pragma solidity ^0.5.0;

import 'https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol';

interface TelephoneInterface {
    function changeOwner(address _owner) external;
}

contract TelephoneOwner is Ownable {
    TelephoneInterface tel = TelephoneInterface(0x3b92904562EC2E6Bbe7889F00FD4BD29f21Ce132);

    function ownPhone() external onlyOwner {
        tel.changeOwner(msg.sender);
    }
}
