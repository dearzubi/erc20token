// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FaltuCoin is ERC20 {

    constructor(uint256 _supply) ERC20("FALTU", "FLTU") {

        _mint(msg.sender, _supply * (10 ** decimals()));
        
    }
}

