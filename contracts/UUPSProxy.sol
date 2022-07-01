// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Proxy } from "@openzeppelin/contracts/proxy/Proxy.sol";

contract UUPSProxy is Proxy {
    // The super token factory will be using this slot to store the address of the logic contract once it is upgraded
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    // Called only once, when the Super Token Factory initializes the custom super 
    // token logic. Checks that the "initialAddress" provided is not the zero address
    // Then it checks that the implementation has not already been set i.e. the 
    // implementation slot in storage should point to an empty value.
    function initializeProxy(address initialAddress) external {
        require(
            initialAddress != address(0),
            "UUPSProxy: zero address"
        );
        require(
            _implementation() == address(0),
            "UUPS: initialized"
        );
        assembly {
            sstore(_IMPLEMENTATION_SLOT, initialAddress)
        }
    }
    
    function _implementation()
        internal
        virtual
        override
        view
        returns (address impl)
    {
        assembly {
            impl := sload(_IMPLEMENTATION_SLOT)
        }
    }
}