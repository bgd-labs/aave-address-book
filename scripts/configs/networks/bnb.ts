import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const bnbAddresses: NetworkAddresses = {
  name: 'BNB',
  chainId: ChainId.bnb,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0xCb45E82419baeBCC9bA8b1e5c7858e48A3B26Ea6',
    PROXY_ADMIN: '0x39EBFfc7679c62Dfcc4A3E2c09Bcb0be255Ae63c',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    AAVE_CL_ROBOT_OPERATOR: '0x51Bd3d6011Dd0BD88Ee1bEA1a67be799A6A09D79',
  },
};
