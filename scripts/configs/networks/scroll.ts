import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const scrollAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
  AFC_SAFE: Hex;
  MASIV_SAFE: Hex;
  APE_VOTING_SAFE: Hex;
}> = {
  name: 'Scroll',
  chainId: ChainId.scroll,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROXY_ADMIN: '0x782559e349b084bB7C07c08404aE6E3436cDAE2E',
    CREATE_3_FACTORY: '0xC6f44D0daC966658Db36742f5153bDa0EBbb45ab',
    PROTOCOL_GUARDIAN: '0xCb45E82419baeBCC9bA8b1e5c7858e48A3B26Ea6',
    wstETH_stETH_AGGREGATOR: '0xE61Da4C909F7d86797a0D06Db63c34f76c9bCBDC',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    MASIV_SAFE: '0xdef1FA4CEfe67365ba046a7C630D6B885298E210',
    APE_VOTING_SAFE: '0xa9e777D56C0Ad861f6a03967E080e767ad8D39b6',
  },
};
