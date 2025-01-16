import {describe, it, expect} from 'vitest';
import {getUmbrellaConfig} from '../../scripts/generator/umbrella';

describe('umbrellaGenerator', () => {
  it('should generate the config', async () => {
    const config = await getUmbrellaConfig(84532, '0x779f13D3C70B50707a1C1ac9772c117cC3aDA477');
    expect(config).toMatchInlineSnapshot(`
      {
        "coverage": [
          {
            "configs": [
              {
                "isReserveStataToken": false,
                "liquidationBonus": 10000n,
                "oracle": "0x0000000000000000000000000000000000000000",
                "stakeToken": "0xFCf0DbDE4a68C95EeE14dD7f2FE61e09F9Fb5433",
              },
            ],
            "reserve": "0xba50Cd2A20f6DA35D788639E581bca8d0B5d4D5f",
          },
          {
            "configs": [
              {
                "isReserveStataToken": false,
                "liquidationBonus": 10000n,
                "oracle": "0x0000000000000000000000000000000000000000",
                "stakeToken": "0xE9bd69a6d6bE3A18017b29db0Bc771e98de67642",
              },
            ],
            "reserve": "0x0a215D8ba66387DCA84B284D18c3B4ec3de6E54a",
          },
          {
            "configs": [
              {
                "isReserveStataToken": false,
                "liquidationBonus": 10000n,
                "oracle": "0x0000000000000000000000000000000000000000",
                "stakeToken": "0xbAF767aF5e31b13aCAeFFE1db94f76B5026f9b54",
              },
            ],
            "reserve": "0x54114591963CF60EF3aA63bEfD6eC263D98145a4",
          },
          {
            "configs": [
              {
                "isReserveStataToken": false,
                "liquidationBonus": 10000n,
                "oracle": "0x0000000000000000000000000000000000000000",
                "stakeToken": "0xA8EB382804BEE84985053C4ce5F94E9e91593042",
              },
            ],
            "reserve": "0x4200000000000000000000000000000000000006",
          },
          {
            "configs": [
              {
                "isReserveStataToken": false,
                "liquidationBonus": 10000n,
                "oracle": "0x0000000000000000000000000000000000000000",
                "stakeToken": "0x98297F8CE8fBE6Ac21Baa23549389852D28715C4",
              },
            ],
            "reserve": "0xD171b9694f7A2597Ed006D41f7509aaD4B485c4B",
          },
          {
            "configs": [
              {
                "isReserveStataToken": false,
                "liquidationBonus": 10000n,
                "oracle": "0x0000000000000000000000000000000000000000",
                "stakeToken": "0xF045cAB6235e10116319D94B1c5970DAAe9b7136",
              },
            ],
            "reserve": "0x810D46F9a9027E28F9B01F75E2bdde839dA61115",
          },
        ],
        "pool": "0x7b2F44923254d438556CA0faC364920e72b700c0",
        "stakeTokens": [
          "0xa31db6E41C18f9B613841789C5B064Cf30bD45C3",
          "0xFCf0DbDE4a68C95EeE14dD7f2FE61e09F9Fb5433",
          "0xE9bd69a6d6bE3A18017b29db0Bc771e98de67642",
          "0x5a800AE2117715F83a822Bed1815AcCA06c82785",
          "0x5b2BB8d0D536B0eb0cEaEb47d0E1492D8222bf65",
          "0xbAF767aF5e31b13aCAeFFE1db94f76B5026f9b54",
          "0xA8EB382804BEE84985053C4ce5F94E9e91593042",
          "0x6BF88300d11c701a7b7D2A91501062bb7650d2cF",
          "0x2d4088BD07145121c348841497EA028389c4d966",
          "0x98297F8CE8fBE6Ac21Baa23549389852D28715C4",
          "0xF045cAB6235e10116319D94B1c5970DAAe9b7136",
          "0x32735b634571904008D29086C95e90b558758F9f",
          "0x7c743cCAE301b558D2DB0c72D6d69C792AA2E4c9",
          "0x4Dc9749D5FF960e92b21800CC0a6fC7A2aD606f8",
          "0x8d1dF6F3602f1Ca01f01F6e6d1071B205FbB0026",
          "0xF2176ACe5DA79291D176C645a725eBa96A8f246D",
          "0xC550C904e04C6046122C0271A5D90891870f8824",
          "0xA821016E5A282676c07FeC5217016e229B518dE0",
        ],
      }
    `);
  });
});
