pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //expected id of the pet that we will be using in testing
    uint256 expectedPetId = 8;
    // expected owner of the adopted pet in this contract
    address expectedAdopter = address(this);

    // Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint256 actualPetId = adoption.adopt(expectedPetId);

        Assert.equal(
            actualPetId,
            expectedPetId,
            "Adoption of the expected pet id should match actual pet id."
        );
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        address actualAdopter = adoption.adopters(expectedPetId);

        Assert.equal(
            actualAdopter,
            expectedAdopter,
            "actualAdopter should be this contract (expectedAdopter)"
        );
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(
            adopters[expectedPetId],
            expectedAdopter,
            "Owner of the expected pet should be this contract"
        );
    }
}
