pragma solidity ^0.4.18

contract Captain {
    // state variables
    address captain;

    // modifiers
    modifier onlyCaptain() {
        require(msg.sender == captain);
        _;
    }

    // constructor
    constructor () public {
        captain = msg.sender;
    }
}