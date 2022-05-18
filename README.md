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

## Remix Development environment
Remix is an easy to use development environment directly available within your web browser. Simply it is a browser-based IDE.

Point your browser at: https://remix.ethereum.org/

## Usefull Resources
* Remix online editor - https://remix.ethereum.org/
