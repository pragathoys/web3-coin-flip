# web3-coin-flip
Imitate the flip of a coin and provide a trusted result of tail or head.

## Introduction
In this project I want to build a small Dapp with the following functionality:

* the user will be able to click a button
* the Dapp will call the smart contract
* the Dapp will provide a result

The functionality of the smart contract will be to store the user's address and the result. Some metadata will be saved as well.

The result will be either 'head' or 'tail'

## The smart contract
Lets first create the smart cotnracts.

Point your browser at: https://remix.ethereum.org/

Create a new file inside the contracts folder and name it as coinflip.sol . You can copy and paste the code of the file [coinflip_v1.sol](contracts/coinflip_v1.sol).

This is the basic structure of our smart contract:

```Solidity
/* SPDX-License-Identifier: UNLICENCED */
pragma solidity ^0.8.0;

contract Coinflip{

    function flip() public{

    }
    
}
```

You can go ahead and compile the contract to test if you have any mistake in it.

Now that we have a basic structure lets add a function to calculate a random number between a minimum and a maximum value. If you want to learn more about this topic ready the related section further below.

Add this code inside the contract:
```Solidity
    function randomize() private view returns(uint){
        bytes32 string_hashed = keccak256( abi.encode( block.difficulty , block.timestamp ) );
        return uint(string_hashed);
    }   
```
 You can copy and paste the code of the file [coinflip_v2.sol](contracts/coinflip_v2.sol).


## Pseudo Random logic
Since there is no builtin function to create a random number we will use what we have. So our logic will be:
1. Create a unique hashed string
2. Convert the hashed string into a uint number
3. Use this number as a random number

For this to work we will use the keccak256 (SHA-3 family) algorithm which computes the hash of an input to a fixed length output. The input can be a variable length string or number, but the result will always be a fixed bytes32 data type:
```Solidity
bytes32 string_hashed = keccak256( <RANDOM STRING> );
```

In order to make things more random we will combine two unique string at each moment from the blockchain itself, the difficulty of the blockchain and the timestamp:
```Solidity
    abi.encode( block.difficulty , block.timestamp )
```

Please notice that we have used **abi.encode** instead of **abi.encodePacked** in order to avoid any possible collisions.

## Remix Development environment
Remix is an easy to use development environment directly available within your web browser. Simply it is a browser-based IDE.

Point your browser at: https://remix.ethereum.org/

## Usefull Resources
* Remix online editor - https://remix.ethereum.org/
