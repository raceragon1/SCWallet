// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Bank{       
    
//////////intial set up and events
    
    //uint pot;  //the money?

    mapping(address => uint) Account  ;

    address payable bossman;  //deployer
    //uint front;  //fake money?
    //uint Amount;

    constructor(){
        bossman = payable(msg.sender);
    }

    modifier onlybossman{
        require(msg.sender == bossman); //makes sure transcation occurs only when bossman is the msgsender
         _;
    }

    modifier amountCap(uint ){
       require(msg.value <= Account[msg.sender]);  // makes sure only amount of the account is taken from the pot
       _;
    }
//////////////

    function Balance() view public returns(uint){
       return Account[msg.sender];
    }

    function contractbalance() view public returns(uint){
       return address(this).balance;
    }
    //event withdraw(uint value) ;
    //event deposite(uint value) ;

//////////deposits fn

    function Deposite() public payable {   
        //pot = pot + Amount;
        //front = Amount;
        Account[msg.sender] = Account[msg.sender] + msg.value;
        //emit deposite(balance);
    }

//////////withdraw fn
    //msg.value = Amount;
   
    function Withdraw (address payable address[msg.sender]) public payable amountCap(msg.value) {   
       // pot = pot - Amount;
        //msg.value == Amount;
       // Account[msg.sender] = Account[msg.sender] - msg.value;
       (msg.sender).transfer(msg.value);
        //emit withdraw(balance);
    }

/////////drain all
    uint drain;
    
   function drainall(address payable bossman) public onlybossman payable {
       address(this).balance == drain;
       bossman.transfer(drain);

       // Account[msg.sender] = Account[msg.sender] + pot; //????????????????
     }

}