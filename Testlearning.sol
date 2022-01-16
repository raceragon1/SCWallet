// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Bank{       
    
//////////intial set up and events

    mapping(address => uint) Account  ;

    address payable bossman;  //deployer

    constructor(){
        bossman = payable(msg.sender);
    }

    modifier onlybossman{
        require(msg.sender == bossman); //makes sure transcation occurs only when bossman is the msgsender
         _;
    }

    modifier amountCap(uint Amount){
       require(Amount <= Account[msg.sender]);  // makes sure only amount of the account is taken from the contract
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
    
    
    function Withdraw (uint Amount) public payable amountCap(Amount) {   
       address payable _to = payable(msg.sender);
       _to.transfer(Amount);
       Account[msg.sender] = Account[msg.sender] - Amount; 
       //emit withdraw(balance);
    }

//////////transfer&send

    function TransferFunds (payable address _to ,uint Amount) public payable amountCap(Amount) {
        _to.transfer(Amount);
        Account[msg.sender] = Account[msg.sender] - Amount;
    }

/////////drain all   
   function drainall() public onlybossman payable {
       bossman.transfer(contractbalance());
     }

}