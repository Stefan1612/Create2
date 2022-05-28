// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IbeingCalled {
    function changeX(uint _x) external returns(uint);

}

contract beingCalled {
    uint public x = 3;

    function changeX(uint _x) public returns(uint) {
        x = _x;
        return x;
    }
}

contract caller {

    function firstV(address contractX, uint _x) public returns(uint){
        return beingCalled(contractX).changeX(_x);
    }
    function secondV(beingCalled contractX, uint _x) public returns(uint){
        return contractX.changeX(_x);
    }
    function interfaceV(address contractX, uint _x) public returns(uint){
        return IbeingCalled(contractX).changeX(_x);
    }
}
