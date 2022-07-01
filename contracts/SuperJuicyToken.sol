// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { SuperTokenBase } from "./SuperTokenBase.sol";
import { UUPSProxy } from "./UUPSProxy.sol";

// 1. Deploy the custom SuperToken
// https://goerli.etherscan.io/address/0x860f44e6be2600c35c12711258709a84d75d2209
// 2. Call initializeCustomSuperToken from the Super Token factory contract
// https://goerli.etherscan.io/address/0x94f26B4c8AD12B18c12f38E878618f7664bdcCE2#writeProxyContract
// 3. This will call initializeProxy from the custom SuperToken contract, which as the name suggests, initializes the proxy contract
// 4. Call initialize function on the custom SuperToken contract which mints the new tokens
// https://goerli.etherscan.io/token/0x860f44e6be2600c35c12711258709a84d75d2209

contract SuperJuicyToken is SuperTokenBase, UUPSProxy {
    string internal _message;

    function initialize(
        string calldata name,
        string calldata symbol,
        string calldata message,
        uint256 initialSupply
    ) external {

        _message = message;
        bool success;

        (success, ) = address(this).call(
            abi.encodeWithSignature(
                "initialize(address,uint8,string,string)",
                address(0),
                18,
                name,
                symbol
            )
        );
        require(success, "init failed");

        (success, ) = address(this).call(
            abi.encodeWithSignature(
                "selfMint(address,uint256,bytes)",
                msg.sender,
                initialSupply,
                new bytes(0)
            )
        );
        require(success, "selfMint failed");
    }

    function readMessage()
        public
        view
        returns(string memory)
    {
        return _message;
    }
}