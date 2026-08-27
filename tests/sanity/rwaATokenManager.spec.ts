import {describe, it, expect} from 'vitest';
import * as addressBook from 'src/ts/AaveAddressBook';
import {getContract, keccak256, toBytes} from 'viem';
import {getClient} from 'scripts/clients';

// roles as defined in RwaAToken and RwaATokenManager of aave-v3-horizon
const ATOKEN_ADMIN_ROLE = keccak256(toBytes('ATOKEN_ADMIN'));
const AUTHORIZED_TRANSFER_ROLE = keccak256(toBytes('AUTHORIZED_TRANSFER'));

const aclManagerAbi = [
  {
    type: 'function',
    name: 'hasRole',
    inputs: [{type: 'bytes32'}, {type: 'address'}],
    outputs: [{type: 'bool'}],
    stateMutability: 'view',
  },
] as const;

const rwaATokenManagerAbi = [
  {
    type: 'function',
    name: 'AUTHORIZED_TRANSFER_ROLE',
    inputs: [],
    outputs: [{type: 'bytes32'}],
    stateMutability: 'view',
  },
] as const;

async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  const aclManager = getContract({
    abi: aclManagerAbi,
    address: addresses.ACL_MANAGER,
    client,
  });
  const manager = getContract({
    abi: rwaATokenManagerAbi,
    address: addresses.RWA_A_TOKEN_MANAGER,
    client,
  });

  // the manager needs the ATokenAdmin role on the pool to execute authorized transfers
  const hasATokenAdminRole = await aclManager.read.hasRole([
    ATOKEN_ADMIN_ROLE,
    addresses.RWA_A_TOKEN_MANAGER,
  ]);
  expect(hasATokenAdminRole).toBe(true);

  // identity check that the address is actually an RwaATokenManager
  const authorizedTransferRole = await manager.read.AUTHORIZED_TRANSFER_ROLE();
  expect(authorizedTransferRole).toBe(AUTHORIZED_TRANSFER_ROLE);
}

describe('rwa aToken manager', () => {
  Object.keys(addressBook).forEach((library) => {
    const addresses = addressBook[library];
    if (addresses.RWA_A_TOKEN_MANAGER) {
      const client = getClient(addresses.CHAIN_ID);
      it.concurrent(`should hold the ATokenAdmin role: ${client.chain!.name}`, async () => {
        return check(addresses);
      });
    }
  });
});
