pragma solidity >=0.4.0 <0.8.25;

// Create contract here;
contract ZombieFactory {

    // declaring a new event 
    event NewZombie(uint zombieId, string name, uint dna);

    // variable initialisation
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // Struct to represent a Zombie
    struct Zombie {
        string name;
        uint dna;
    }

    // Array
    Zombie[] public zombies;

    // Methods
    function _createZombie(string memory _name, uint _dna) private {
        // function code
        uint id = zombies.push(Zombie(_name, _dna)) - 1;

        // fire an emit here
        emit NewZombie(id, _name, _dna);
    }

    // string greeting= "Whats up Dawg";

    // function sayHello() public returns (string memory){
    //     return greeting;        
    // }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    // event IntegersAdded(uint x, uint y, uint result);

    // function add(uint _x, uint _y) public returns (uint _result) {
    //     uint result = _x + _y;
    //     // fire an even t to let the app know the function 
    //     emit IntegersAdded(_x, _y, result);
    //     return result;
    // }

    // On frontend you can have:
    // YourContract.IntegersAdded(function(error, result) {
    //     // do something with react
    // })
}
