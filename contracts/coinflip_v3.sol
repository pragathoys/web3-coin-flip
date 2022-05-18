/* SPDX-License-Identifier: UNLICENSED */
pragma solidity ^0.8.0;

contract Coinflip{

    function flip() public view returns(string memory){
        uint random_modulo = randomize() % 2;
        if(random_modulo == 0){
            return "head";
        }else{
            return "tail";
        }   
    }

    function randomize() private view returns(uint){
        bytes32 string_hashed = keccak256( abi.encode( block.difficulty , block.timestamp ) );
        return uint(string_hashed);
    }    
    
}