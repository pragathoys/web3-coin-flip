/* SPDX-License-Identifier: UNLICENCED */
pragma solidity ^0.8.0;

contract Coinflip{

    function flip() public{

    }

    function randomize() private view returns(uint){
        bytes32 string_hashed = keccak256( abi.encode( block.difficulty , block.timestamp ) );
        return uint(string_hashed);
    }    
    
}