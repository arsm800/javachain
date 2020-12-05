# Javachain

## Overview

Javachain is a full-stack blockchain decentralized application that supports the creation of verifiable financial statements and business operations/accounting functions for a hypothetical coffee shop.  

Blockchain technology's unique selling proposition is decentralization--a concept that is primed to disrupt a number of industries.  In the context of business operations and accounting, one of the biggest challanges contractual parties face is trust, or in other words, financial statements that can be relied upon. Financial statement auditing is one specific area where blockchain has the potential to completely reshape the process.  Javachain is our take on how Ethereum and distributed ledger technology might be utilized to facilitate the creation and maintenance of financial statements and business transactions.

Javachain utilizes the Ethererum framework, smart contracts, and ERC777 tokenization to create a way that accounting transactions can be recorded and compiled into financial statements via a distributed ledger.  Financial statement accounts are assigned addresses and ECR777 tokens are minted to an address representing the business owner (owner's equity) upon deployment.  Individual functions within the smart contract represent common journal entries, which send tokens ('Javacoin') representing cash to the appropriate account addresses.  The business owner or accountant (contract deployer) enters transactions and journal entries into Javachain, which are subsequently recorded on the blockchain once consensus is achieved.  Javachain keeps the running balances of each account address and displays them in a balance sheet and income statement format, with a running balance representing the coffee shop owner's equity. 

Specific business operations can also take advantage of the blockchain.  As part of an additional set of features, Javachain has smart contracts to support payroll processing, a lease agreement with a landlord, and purchasing inventory from a third party vendor.  For payroll, this consists of a struct of employee information mapped to an employee address (wallet).  Payroll can be processed by transferring tokens to those individual employee addresses.  The struct can be modified depending on changes to the size of the workforce (hirings, departures, etc.)  

The implications of these smart contracts are far-reaching; this application can be expanded to include many other business processes and features, effectively transforming it into a sort of blockchain-based Quickbooks or TurboTax. 

## Business Development Process

1.	Research what the big 4 accounting firms have been saying on this.
2.	Blockchain Accounting for Business: decide what business transactions that we want to support
  a.	Investment in a business from an owner (cash and owners equity).
  b.	Purchase of assets (goods, inventory).
  c.	Employee Cost.
  d.	Sales of goods on cash.
3.	Set the data we want to store on the blockchain (ie, what needs to be debited and credited for each transaction, uri of supporting docs).
4.	Write the smart contracts that support business transactions
5.	Establish the business and its accounting records for 1 year and run through the smart contracts. Use Ganache.
6.	Deploy to Github pages with a good user interface. *** As the deliverable *** 
7.	Establish a token that offers access to financial statements that can be given to  a bank or investor or represents investment in the business / economics or voting interest.
8.	See if we could distribute among our four computers.

## Deployment Instructions

* Ropsten Network

* Truffle Suite

* Using the webform


Getting Started with Truffle
Install the packages in Terminal/CMD:

```
npm install -g truffle ganache-cli live-server
```

Create project folder

mkdir “Your project name”
cd “Your project name”

Execute command that creates a bare Truffle project without anything else included.


truffle init

Contract Compilation
Create a very simple smart contract named HelloWorld.sol and place it inside the contracts folder. All smart contracts you create should be placed inside this folder.

truffle compile

Contract Deployment
Create a new file in the migrations directory named 2_deploy_contracts.js
Open truffle-config.js, and change the networks part:
networks: {
  development: {
    host: “127.0.0.1”,
    port: 8545,
    network_id: “*”
  }
}

Deploying contract by executing this command:

truffle migrate

Open a new Terminal/CMD and start Ganache on port 8545 by executing the following command:

ganache-cli -p 8545


Now, back to our first Terminal/CMD, execute

truffle migrate -network development
to deploy the code to the blockchain. In our case, the blockchain could be found in the network development which we set earlier in the truffle-config.js file.



## Technologies Used

* [Solidity](https://soliditylang.org)
* [JavaScript](https://www.javascript.com)
* [HTML](https://devdocs.io/html/)
* [Ethereum Virtual Machine](https://ethereum.org/en/developers/docs/evm/)
* [Remix IDE](https://remix-ide.readthedocs.io/en/latest/)
* [Truffle Suite](https://www.trufflesuite.com)
* [Ganache](https://www.trufflesuite.com/ganache)

## Project Team

* [Eric Baran](https://github.com/ebizz403s)
* [Bryan Castillo](https://github.com/Bcastillo44)
* [Andrew Rubi](https://github.com/andrewjrubi)
* [Andrew Smith-Mui](https://github.com/arsm800)
