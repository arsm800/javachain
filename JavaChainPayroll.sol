pragma solidity ^0.6.2;

contract Payroll {

    address public owner;
    uint public nextEmployeeID;
    struct Employee {
        uint employeeId;
        uint wages;
        uint balance;
    }

    mapping (address => Employee) employees;

    function MakePayment() public {
        owner = msg.sender;
        addEmployee(msg.sender, 0);
    }

    //Add employee w/ address and wage
    function addEmployee(address _employee, uint _wages) public {
        nextEmployeeID++;
        employees[_employee].employeeId=nextEmployeeID;
        employees[_employee].wages=_wages;
    }

    function removeEmployee(address _employee) public {
        employees[_employee].wages=0;
        employees[_employee].employeeId=0;
    }

    //Modify the employee wages
    function modifyEmployeeWages(address _employeeId, uint _newWage) public {
        employees[_employeeId].wages = _newWage;
    }
}
