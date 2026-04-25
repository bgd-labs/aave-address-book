// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IHub} from 'aave-v4/hub/interfaces/IHub.sol';
import {IHubConfigurator} from 'aave-v4/hub/interfaces/IHubConfigurator.sol';
import {ISpoke} from 'aave-v4/spoke/interfaces/ISpoke.sol';
import {ISpokeConfigurator} from 'aave-v4/spoke/interfaces/ISpokeConfigurator.sol';
import {ITokenizationSpoke} from 'aave-v4/spoke/interfaces/ITokenizationSpoke.sol';
import {ITreasurySpoke} from 'aave-v4/spoke/interfaces/ITreasurySpoke.sol';
import {IAaveOracle} from 'aave-v4/spoke/interfaces/IAaveOracle.sol';
import {IConfigPositionManager} from 'aave-v4/position-manager/interfaces/IConfigPositionManager.sol';
import {IGiverPositionManager} from 'aave-v4/position-manager/interfaces/IGiverPositionManager.sol';
import {ITakerPositionManager} from 'aave-v4/position-manager/interfaces/ITakerPositionManager.sol';
import {INativeTokenGateway} from 'aave-v4/position-manager/interfaces/INativeTokenGateway.sol';
import {ISignatureGateway} from 'aave-v4/position-manager/interfaces/ISignatureGateway.sol';
import {IAaveV4ConfigEngine} from 'aave-v4/config-engine/interfaces/IAaveV4ConfigEngine.sol';
import {IAccessManagerEnumerable} from 'aave-v4/access/interfaces/IAccessManagerEnumerable.sol';
