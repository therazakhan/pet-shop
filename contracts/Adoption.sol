pragma solidity ^0.5.0;

contract Adoption{

    address[16] public adopters;

    function adopt(uint pet_id) public returns (uint) {
        require(pet_id >= 0 && pet_id <= 15, 'pet id invalid');

        adopters[pet_id] = msg.sender;
        return pet_id;
    }

    function getAdopters() public view returns (address[16] memory){
        return adopters;
    }
}