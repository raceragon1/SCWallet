// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Bank{       
    
//////////intial set up and events
    
    mapping(address => uint)  Account ;
   

    function Balance() view public returns(uint){
       return Account[msg.sender];
    }

    //event withdraw(uint value) ;
    //event deposite(uint value) ;

//////////deposits fn

    function Deposite(uint Deposite_Amount) public{
        Account[msg.sender] = Account[msg.sender] + Deposite_Amount;
        //emit deposite(balance);
    }

//////////withdraw fn

    function Withdraw (uint Withdraw_Amount) public{
        Account[msg.sender] = Account[msg.sender] - Withdraw_Amount;
        //emit withdraw(balance);
    }
}