pragma solidity ^0.6.2;

// Import the ERC-777 standarization
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC777/ERC777.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"; <-- this may have caused error

// Overall TODO, make transaction functions, figure out exchange rate, make owner only defined functions, 
// check security, require functions or modifier functions, IPFS for receipts, emit events in the code

contract Javabit is ERC777 {
    
    // Set the business owner
    address payable business_owner;
    // Set the accountant, whose account will be used as an authroized user to perform transactions?
    address[] authorizedAccountant = [0x03A94eD43073B0Da131958611fcC200FF39e93B7, 0x28Ecc504b8940582b03FA43c91A2A9b2A04a603D];
    
    // Establish a structure that holds data related to company's accounts
    struct Account {
        // category should be assets, liabilities, equity (may skip doing seperate revenue and expense accounts and just change equity)
        string category;
        // hold name inside of Account struct since name may not be unique (ie, multiple accounts called cash)
        string name;
        // current value of the accounting record
        uint natural_account;
    }
    
    // Maintain a mapping that will hold the list of addresses mapped to the account information
    mapping (address => Account) accounts; 
    
    // List of account addresses for enumeration
    address[] public account_addresses;
    
    
    /* Set the accountant, only ower can set the accountant
    function setAccountant(address _accountant) onlyOwner public {
        accountant = _accountant;
    }
    */
    
    function createAccounts(address _address, 
                            // asset, liability, equity (we prob dont need to do expense and revenue accts for simplicity)
                            string memory _category, 
                            string memory _name, 
                            uint _natural_account) public {
        accounts[_address] = Account(_category, _name, _natural_account);
        account_addresses.push(_address);
    }
    
    
    // The constructor code will run at contract setup
    //Make sure your contract deploy address (biz owner) and cash account address are different
    constructor(uint initialSupply, address payable _cash_account) public ERC777("Javabit1", "JB1", authorizedAccountant) {
        // Set the business_owner's address, used to give control to the contract for the accounts
        business_owner = msg.sender;
        // Create the initial accounts for starting business
        createAccounts(msg.sender, 'owners_equity', 'equity', 3000);
        createAccounts(_cash_account, 'cash', 'asset', 1000);          
        // Invest inital amount
        mint(msg.sender, initialSupply);
        mint(_cash_account, initialSupply);        
    }
    
    modifier onlyOwner {
        require(msg.sender == business_owner, "You are not authorized to execute this transaction");
        _;
    }
    
    // Invest money into the business
    function mint(address payable _account_addresses, uint _investment_amount) public {
        _mint(_account_addresses, _investment_amount, "", "");
    }
/*

    // Complete function to update accountant
    function updateAccountant() public {
        // 
    }
    
*/

    // Complete function for paying lease (- cash, - equity via expense), assume lease increases utilities
    function payLease(address payable _cash_account, address payable _lease_expense_account, uint _lease_expense_amount) public {
        // TODO 
        // Add onlyOwner requirements if necessary
        // Check that accounts are already in account_addresses and match the name - (modifier)
        
        // Trigger transaction
        
        //send javacoin to _lease_expense_account
        operatorSend(_cash_account, _lease_expense_account, _lease_expense_amount, "", "");
        //Where can we find other methods like this one?
        
        //reduce balance of business_owner (address of owner)
        operatorBurn(business_owner, _lease_expense_amount, "", "");
        
        
        //do we need to add to struct?
        //Deploy contract and manually add accounts and addresses to struct then.
    }
    
    
    // Complete function for purchasing coffee beans (inventory)
    function buyCoffeeInventory(address payable _cash_account, address payable _inventory_account, uint _inventory_amount) public {

        // Check that accounts are already in account_addresses and match the name
        // Trigger transaction
        
        operatorSend(_cash_account, _inventory_account, _inventory_amount, "", "");
    }
    
  
    
    // Complete function for paying wages ()
    function paySalary(address payable _cash_account, address payable _salary_expense_account, uint _salary_amount) public {

        // Check that accounts are already in account_addresses and match the name
        // Trigger transaction
        
        operatorSend(_cash_account, _salary_expense_account, _salary_amount, "", "");
        operatorBurn(business_owner, _salary_amount, "", "");
    }
    
 /* 
    // Complete function for tax liabilities (+ liability for taxes payable, - owners equity for retained earnings)
    function addTaxLiability() public {
        // TODO 
        // Check that accounts are already in account_addresses and match the name
        // Trigger transaction
    }
    
    
    // Complete sale (+ cash, - inventory, +/- owners equity (revenue - expenses/cost of goods sold))
    function performSale() public {
        // TODO 
        // Check that accounts are already in account_addresses and match the name
        // Trigger transaction
    }
    
    
    // Complete any reconciliation function to manually manage anything not supported in the contract
    // ie address, mint or burn, with description of reconcilation entry
    
    
*/
    // gets all the account addresses stored in memory
    function getAccounts() view public returns(address[] memory) {
        return account_addresses;
    }
    
    
    function getAccount(address _address) view public returns (string memory, string memory, uint) {
        return (accounts[_address].category, accounts[_address].name, accounts[_address].natural_account);
        // OR JUST ? return (accounts[_address].category, accounts[_address].name, _address.balance);
    }
    
    // gets the number of account addresses we have stored
    function countAccounts() view public returns (uint) {
        return account_addresses.length;
    }
}

