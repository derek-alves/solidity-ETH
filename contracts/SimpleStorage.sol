pragma solidity ^0.6.0;

contract SimpleStorage{

    uint256 public favoriteNumber;
    uint256 private privateValue = 10;
    
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    
    //are functions that cannot be called in the same contract.
    function storeExternal(uint256 _favoriteNumber) external{
        favoriteNumber = _favoriteNumber;
    }

    //only can be call by other function in the same contract.
    function storeInternal(uint256 _favoriteNumber) internal {
        favoriteNumber = _favoriteNumber;
    }

    //only can be visible in the contract are defined.
    function storePrivate(uint256 _favoriteNumber) private {
        favoriteNumber = _favoriteNumber;
    }

    //view and pure are function type that you actually dont have to make transactions

    //view - read some state in the blockchain
    function retrieve() public view returns(uint256){
        return privateValue;
    }

    //pure - do some type of math
    function math(uint256 value) public pure {
        20 + value;
    }

    //struct - define new type 
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    //can be define specific size to array
    // exemple: Array[2] = two positions
    People[] public people;
    

    People public person = People({ favoriteNumber: 2, name: "Derek"});

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
    }

    //solidity have two ways to store data
    // memory and storage
    
    //memory = Data will only be storage during the execution of the function 
    //storage = Data will persist even after the function is executed


}