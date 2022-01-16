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

    modifier amountCap(uint x){
       require(x <= Account[msg.sender]);  // makes sure only amount of the account is taken from the pot
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
        Account[msg.sender] = Account[msg.sender] + msg.value;
        //emit deposite(balance);
    }

//////////withdraw fn
    //msg.value = Amount;
    
    function Withdraw (address payable _to) public payable  {   
       // pot = pot - Amount
       uint x = msg.value;
       address payable _to = payable(msg.sender);
       _to.transfer(x);

       Account[msg.sender] = Account[msg.sender] - msg.value; 
       //emit withdraw(balance);
    }

/////////drain all   
   function drainall() public onlybossman payable {
       bossman.transfer(contractbalance());
     }

}