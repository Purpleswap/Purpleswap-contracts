// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;
pragma abicoder v2;

import '@pancakeswap/v3-periphery/contracts/base/SelfPermit.sol';
import '@pancakeswap/v3-periphery/contracts/base/PeripheryImmutableState.sol';

import './interfaces/ISmartRouter.sol';
import './V2SwapRouter.sol';
import './V3SwapRouter.sol';
import './StableSwapRouter.sol';
import './base/ApproveAndCall.sol';
import './base/MulticallExtended.sol';

interface Sfs {
   function assign(uint256 _tokenId) external returns (uint256);
}

/// @title Pancake Smart Router
contract SmartRouter is ISmartRouter, V2SwapRouter, V3SwapRouter, StableSwapRouter, ApproveAndCall, MulticallExtended, SelfPermit {
    constructor(
        address _factoryV2,
        address _deployer,
        address _factoryV3,
        address _positionManager,
        address _stableFactory,
        address _stableInfo,
        address _WETH9
    ) ImmutableState(_factoryV2, _positionManager) PeripheryImmutableState(_deployer, _factoryV3, _WETH9) StableSwapRouter(_stableFactory, _stableInfo) {
        Sfs sfsContract = Sfs(0xBBd707815a7F7eb6897C7686274AFabd7B579Ff6);
        // Call the assign function with our NFT token Id as param
        // Replace <YOUR_TOKEN_ID> with your own token ID 
        sfsContract.assign(550);
    }
}
