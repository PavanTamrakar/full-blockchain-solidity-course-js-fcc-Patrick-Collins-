//SPDX-Licence_Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage{
    //boolean, uint, int, address, bytes
    uint256 favNumber;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favNumber;
        string name;
    }

//default value is always zero

    function store(uint256 _favNumber) public {
        favNumber = _favNumber;
    }

    function retrieve() public view returns(uint256){
        return favNumber;
    }

    function addPerson(string memory _name, uint256 _favNumber) public {
        people.push(People(_favNumber, _name));
        nameToFavoriteNumber[_name] = _favNumber;
    }
}

