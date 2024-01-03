// SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

// This helps in creating the state variables that keeps the track of how many products are stored in yout contract.
contract Marketplace{
    uint internal productsLength = 0;

     struct Product {
        address payable owner;
        string name;
        string image;
        string description;
        string location;
        uint price;
        uint sold;
    }

    mapping (uint => Product) internal products;


    function writeProduct(
        string memory _name,
        string memory _image,
        string memory _description,
        string memory _location,
        uint _price
    ) public {
        uint _sold = 0;
        products[productsLength] = Product(
            payable(msg.sender),
            _name,
            _image,
            _description,
            _location,
            _price,
            _sold
        );
        productsLength++;
    }

// public function that will return the number of products stored, which will iterate over in the frontend
    function getProductLength() public view returns (uint) {
        return (productsLength);
    }
}