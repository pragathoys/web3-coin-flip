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
Lets first create the smart cotnract.

Point your browser at: https://remix.ethereum.org/

Create a new file inside the __contracts__ folder and name it as **coinflip.sol** . You can copy and paste the code of the file [coinflip_v1.sol](contracts/coinflip_v1.sol).

This is the basic structure of our smart contract:

```Solidity
/* SPDX-License-Identifier: UNLICENSED */
pragma solidity ^0.8.0;

contract Coinflip{

    function flip() public{

    }
    
}
```

You can go ahead and compile the contract to test and check if you have any mistake.

Now that we have a basic structure lets add a function to calculate a random number. If you want to learn more about this topic ready the related section further below **Pseudo Random logic**.

Add this code inside the contract:
```Solidity
    function randomize() private view returns(uint){
        bytes32 string_hashed = keccak256( abi.encode( block.difficulty , block.timestamp ) );
        return uint(string_hashed);
    }   
```
You can also copy and paste the code of the file [coinflip_v2.sol](contracts/coinflip_v2.sol).

Now lets add the following logic inside the **flip()** function:
```Solidity
    uint random_modulo = randomize() % 2;
    if(random_modulo == 0){
        return "head";
    }else{
        return "tail";
    } 
 ```
 You can also copy and paste the code of the file [coinflip_v3.sol](contracts/coinflip_v3.sol).

 You can compile and run the flip() method in remix. For example in a 10-times run I got the following:
 Tail-Head-Head-Tail-Tail-Head-Head-Tail-Tail-Tail
 Heads: 4 times
 Tail: 6 times

 Almost around 50% which is an indication that our implementation  is quite fair. Of course you have to run more than 10 times the contract.

## Pseudo Random logic
Since there is no built-in function to create a random number we will use what we have. So our logic will be:

1. Create a unique hashed string
2. Convert the hashed string into a unsigned integer number
3. Use this number as a random number
4. We will check the modulo of this number with 2
5. If the modulo is zero is a 'head' else it is 'tail'

For this to work we will use the keccak256 (SHA-3 family) algorithm which computes the hash of an input to a fixed length output. The input can be a variable length string or number, but the result will always be a fixed bytes32 data type:
```Solidity
    bytes32 string_hashed = keccak256( <RANDOM STRING> );
```

In order to make things more random we will combine two unique string at each moment from the blockchain itself, the difficulty of the blockchain and the timestamp:
```Solidity
    abi.encode( block.difficulty , block.timestamp )
```

Please notice that we have used **abi.encode** instead of **abi.encodePacked** in order to avoid any possible collisions.

Finally,  we convert the hashed string into an unsigned integer with : uint(string_hashed)

we will check the modulo of this number against 2 in order to see if it has or not a modulo. This will convert to either tail or head.

## Remix Development environment
Remix is an easy to use online development environment directly available within your web browser. Simply it is a browser-based IDE.

Point your browser at: https://remix.ethereum.org/ and starting writing code for the blockchain.

## Usefull Resources
* Remix online editor - https://remix.ethereum.org/
* Solidity Types - https://docs.soliditylang.org/en/v0.8.12/types.html
* Contract ABI Specification - https://docs.soliditylang.org/en/develop/abi-spec.html
* SHA-3 - https://en.wikipedia.org/wiki/SHA-3
