// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Errors} from 'aave-address-book/governance-v3/Errors.sol';
import {IBaseReceiverPortal} from 'aave-address-book/governance-v3/IBaseReceiverPortal.sol';
import {IDataWarehouse} from 'aave-address-book/governance-v3/IDataWarehouse.sol';
import {IExecutor} from 'aave-address-book/governance-v3/IExecutor.sol';
import {IGovernanceCore} from 'aave-address-book/governance-v3/IGovernanceCore.sol';
import {IGovernancePowerStrategy} from 'aave-address-book/governance-v3/IGovernancePowerStrategy.sol';
import {IPayloadsControllerCore} from 'aave-address-book/governance-v3/IPayloadsControllerCore.sol';
import {IVotingMachineWithProofs} from 'aave-address-book/governance-v3/IVotingMachineWithProofs.sol';
import {IVotingPortal} from 'aave-address-book/governance-v3/IVotingPortal.sol';
import {IVotingStrategy} from 'aave-address-book/governance-v3/IVotingStrategy.sol';
import {PayloadsControllerUtils} from 'aave-address-book/governance-v3/PayloadsControllerUtils.sol';
