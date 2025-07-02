import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const gnosisAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
  AFC_SAFE: Hex;
  MASIV_SAFE: Hex;
  MERIT_AHAB_SAFE: Hex;
}> = {
  name: 'Gnosis',
  chainId: ChainId.gnosis,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROXY_ADMIN: '0xe892E40C92c2E4D281Be59b2E6300F271d824E75',
    CREATE_3_FACTORY: '0x2cC41488f4494c5e11cB6cbA82199442B9f495B6',
    PROTOCOL_GUARDIAN: '0xCb45E82419baeBCC9bA8b1e5c7858e48A3B26Ea6',
    wstETH_stETH_AGGREGATOR: '0x0064AC007fF665CF8D0D3Af5E0AD1c26a3f853eA',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    MASIV_SAFE: '0xdef1FA4CEfe67365ba046a7C630D6B885298E210',
    MERIT_AHAB_SAFE: '0xdeadD8aB03075b7FBA81864202a2f59EE25B312b',
  },
};
