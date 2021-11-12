// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FaltuCoin is ERC20 {

    address public admin;
    uint256 public mintLimit;

    modifier onlyAuthorized() {
        require(admin == msg.sender, "Not authorized to execute");
        _;
    }

    modifier mintLimited(uint256 _amount){
        require(_amount <= mintLimit, "Amound exceeded mint limit exceeded");
        _;
    }

    constructor(uint256 _supply, uint256 _mintLimit) ERC20("FALTU", "FLTU") {

        admin = msg.sender;
        mintLimit = _mintLimit;

        _mint(msg.sender, _supply * (10 ** decimals()));

    }

    function mint(address _to, uint256 _amount) public onlyAuthorized mintLimited(_amount){

        require(_amount > 0, "Amount must be greater than zero");
        require(_to != address(0), "Invalid recipient address");

        _mint(_to, _amount * (10 ** decimals()));
    }

    function burn(uint256 _amount) public onlyAuthorized{
        require(_amount > 0, "Amount must be greater than zero");
        _burn(msg.sender, _amount);
    }
}

