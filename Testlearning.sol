// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Bank{       
    
//////////intial set up and events
    
    mapping(address => uint)  Account ;
    address public bossman;

    constructor(){
        bossman = msg.sender;
    }

    function Balance() view public returns(uint){
       return Account[msg.sender];
    }

    //event withdraw(uint value) ;
    //event deposite(uint value) ;

//////////deposits fn

    function Deposite(uint Amount) public{
        Account[msg.sender] = Account[msg.sender] + Amount;
        //emit deposite(balance);
    }

//////////withdraw fn

    function Withdraw (uint Amount) public{
        Account[msg.sender] = Account[msg.sender] - Amount;
        //emit withdraw(balance);
    }

/////////drain all
   // if(msg.sender==bossman){
    //        function drainall() public {
}