// SPDX-License-Identifier: CC-BY-SA-4.0

// Version of Solidity compiler this program was written for
pragma solidity ^0.8.11;
contract Faucet {
   address owner;
   constructor () {
      owner = msg.sender;
   }

   function withdraw(uint withdraw_amount) public {

      // maximum withdraw is 0.1 Eth = 100 million giga wei
      require(withdraw_amount < 0.1 ether);

      payable(msg.sender).transfer(withdraw_amount);
   }


   function deposite() external payable {}
   receive() external payable {}

   function close() public onlyOwner{
      selfdestruct(payable(owner));
   }

   modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }
}