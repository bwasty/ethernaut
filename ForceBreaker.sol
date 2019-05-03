pragma solidity ^0.5.0;

import 'https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol';


contract ForceBreaker is Ownable {
    function destroy() external onlyOwner {
        selfdestruct(0xc9a3eEFf9E5230c5111d7deB18116B31F0D38dBc);
    }
}
