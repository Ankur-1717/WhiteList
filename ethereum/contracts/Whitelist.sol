//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.1;


contract Whitelist {
    uint8 public maxWhiteListedAdd;
    mapping(address => bool) public whiteListedAdd;

    uint8 public numberWhiteListedAdd;
    
    constructor(uint8 _maxWhitelistedAdd) {
        maxWhiteListedAdd =  _maxWhitelistedAdd;
    }

    modifier WhiteListed(){
        require(!whiteListedAdd[msg.sender], "You have already been whiteListed.");
        _;
    }

    modifier maxNumber(){
        require(numberWhiteListedAdd < maxWhiteListedAdd, "Limit reached!!");
        _;
    }

    function addToWhiteList() public WhiteListed maxNumber{
        whiteListedAdd[msg.sender] = true;
        numberWhiteListedAdd += 1;
    }

}
