pragma solidity ^0.4.18;

contract Privacy {

  bool public locked = true; // 0
  uint256 public constant ID = block.timestamp; // -
  uint8 private flattening = 10; // 0
  uint8 private denomination = 255; // 0
  uint16 private awkwardness = uint16(now); // 0
  bytes32[3] private data; // 1-3

  function Privacy(bytes32[3] _data) public {
    data = _data;
  }

  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2])); // first 16 bytes of storage slot 3?
    // -> 0x
    // c491db58c1f6ab8a7001c69afe3436ee
    // 7c43109f8b121b0d5414bbf83ac524d0
    // -> solution: 0xc491db58c1f6ab8a7001c69afe3436ee
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}
