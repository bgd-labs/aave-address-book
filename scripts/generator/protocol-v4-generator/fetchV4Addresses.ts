import {readFileSync} from 'fs';
import {resolve} from 'path';
import {Hex} from 'viem';
import {PoolV4Config, Addresses} from '../../configs/types';

interface DeployJson {
  accessManager: Hex;
  configPositionManager: Hex;
  giverPositionManager: Hex;
  hub: Record<string, Hex>;
  hubConfigurator: Hex;
  irStrategy: Record<string, Hex>;
  nativeTokenGateway: Hex;
  oracle: Record<string, Hex>;
  signatureGateway: Hex;
  spoke: Record<string, Hex>;
  spokeConfigurator: Hex;
  takerPositionManager: Hex;
  treasurySpoke: Hex;
}

export function fetchV4Addresses(poolConfig: PoolV4Config): Addresses {
  const raw = readFileSync(resolve(process.cwd(), poolConfig.deployJson), 'utf-8');
  const deploy: DeployJson = JSON.parse(raw);

  const addresses: Addresses = {
    ACCESS_MANAGER: deploy.accessManager,
    CONFIG_POSITION_MANAGER: deploy.configPositionManager,
    GIVER_POSITION_MANAGER: deploy.giverPositionManager,
    HUB_CONFIGURATOR: deploy.hubConfigurator,
    NATIVE_TOKEN_GATEWAY: deploy.nativeTokenGateway,
    SIGNATURE_GATEWAY: deploy.signatureGateway,
    SPOKE_CONFIGURATOR: deploy.spokeConfigurator,
    TAKER_POSITION_MANAGER: deploy.takerPositionManager,
    TREASURY_SPOKE: deploy.treasurySpoke,
  };

  // Flatten hub entries: hub.CORE_HUB -> CORE_HUB
  for (const [key, value] of Object.entries(deploy.hub)) {
    addresses[key] = value;
  }

  // Flatten spoke entries: spoke.MAIN_SPOKE -> MAIN_SPOKE
  for (const [key, value] of Object.entries(deploy.spoke)) {
    addresses[key] = value;
  }

  // Flatten oracle entries: oracle.CORE_HUB -> CORE_HUB_ORACLE
  for (const [key, value] of Object.entries(deploy.oracle)) {
    addresses[`${key}_ORACLE`] = value;
  }

  // Flatten irStrategy entries: irStrategy.CORE_HUB -> CORE_HUB_IR_STRATEGY
  for (const [key, value] of Object.entries(deploy.irStrategy)) {
    addresses[`${key}_IR_STRATEGY`] = value;
  }

  return addresses;
}
