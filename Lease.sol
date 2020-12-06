pragma solidity ^0.5.16;

contract Lease 
{

address payable public owner;
address public tenant;
uint public rentcost;
string public location;
uint public createdTimestamp;
uint public Tpaid;

    constructor() public {
    owner = msg.sender;
    createdTimestamp = block.timestamp;
    location="Seattle";
    rentcost=1000;
    }

    function lease(address _tenant) public payable
    {
     tenant = _tenant;
     Tpaid=msg.value;
    }
    event Tenant(address tenant, uint Tpaid);

function getTenant() public view returns (address)
{
    return tenant;
}

function TerminateContract() public
{
    require(owner==msg.sender);
    owner.transfer(address(this).balance);
}


}