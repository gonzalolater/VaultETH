// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

contract Vault {
    mapping(address => uint) public balances;

    function deposit() public payable
    {
        balances[msg.sender] += msg.value;
    }

    function withdrawAll() public
    {
        address beneficiary = msg.sender;
        uint amount = balances[msg.sender];
        //payable(beneficiary).transfer(amount);
        (bool success, ) = address(beneficiary).call{value: amount}("");
        require(success, "Transfer failed.");
        balances[msg.sender] = 0;
    }
}