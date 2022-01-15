// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Bank{       
    
//////////intial set up and events
    
    uint pot;  //the money?

    mapping(address => uint)  Account ;

    address bossman;  //deployer
    uint front;  //fake money?

     constructor(){
        bossman = msg.sender;
    }

    modifier onlybossman{
        require(msg.sender == bossman); //makes sure transcation occurs only when bossman is the msgsender
         _;
    }

    modifier amountCap{
        require( Account >= Amount);  // makes sure only amount of the account is taken from the pot
        _;
    }
//////////////

    function Balance() view public returns(uint){
       return Account[msg.sender];
    }

    //event withdraw(uint value) ;
    //event deposite(uint value) ;

//////////deposits fn

    function Deposite(uint Amount) public {    //amountcap not added
        pot = pot + Amount;
        front = Amount;
        Account[msg.sender] = Account[msg.sender] + front;
        //emit deposite(balance);
    }

//////////withdraw fn

    function Withdraw (uint Amount) public {   //amountcap not added
        pot = pot - Amount;
        front = Amount;
        Account[msg.sender] = Account[msg.sender] - front;
        //emit withdraw(balance);
    }

/////////drain all
    function drainall() public onlybossman {
          Account[msg.sender] = Account[msg.sender] + pot;
      }

}