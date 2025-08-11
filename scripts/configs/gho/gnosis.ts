import {ChainId} from '@bgd-labs/toolbox';
import {GhoAddresses} from '../types';

export const ghoGnosis: GhoAddresses = {
  name: 'Gnosis',
  chainId: ChainId.gnosis,
  addresses: {
    GHO_TOKEN: '0xfc421ad3c883bf9e7c4f42de845c4e4405799e73',
    GHO_CCIP_TOKEN_POOL: '0xDe6539018B095353A40753Dc54C91C68c9487D4E',
    GHO_ORACLE: '0x360d8aa8f6b09b7bc57af34db2eb84dd87bf4d12',
    GHO_AAVE_CORE_STEWARD: '0x6e637e1e48025e51315d50ab96d5b3be1971a715',
    GHO_BUCKET_STEWARD: '0x6bb7a212910682dcfdbd5bcbb3e28fb4e8da10ee',
    GHO_CCIP_STEWARD: '0x06179f7c1be40863405f374e7f5f8806c728660a',
  },
};
