import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const scrollAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
}> = {
  name: 'Scroll',
  chainId: ChainId.scroll,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xFa2eeb2d0054C3Db2A606E2cd9EE111b62707D1e',
    PROXY_ADMIN: '0x782559e349b084bB7C07c08404aE6E3436cDAE2E',
    CREATE_3_FACTORY: '0xC6f44D0daC966658Db36742f5153bDa0EBbb45ab',
    PROTOCOL_GUARDIAN: '0xCb45E82419baeBCC9bA8b1e5c7858e48A3B26Ea6',
    GOVERNANCE_GUARDIAN: '0x1A0581dd5C7C3DA4Ba1CDa7e0BcA7286afc4973b',
    wstETH_stETH_AGGREGATOR: '0xE61Da4C909F7d86797a0D06Db63c34f76c9bCBDC',
  },
};
