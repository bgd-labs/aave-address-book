const ethers = require("ethers");
const fs = require("fs");
const addressProviderV2ABI = require("./address_provider_v2_abi.json");
const addressProviderV3ABI = require("./address_provider_v3_abi.json");

const KOVAN_RPC = "https://kovan.poa.network";
const RINKEBY_RPC = "https://rinkeby-light.eth.linkpool.io/";
const MAINNET_RPC = "https://rpc.flashbots.net/";
const MUMBAI_RPC = "https://polygon-mumbai.g.alchemy.com/v2/demo";
const POLYGON_RPC = "https://polygon-rpc.com";
const FUJI_RPC = "https://api.avax-test.network/ext/bc/C/rpc";
const AVALANCHE_RPC = "https://api.avax.network/ext/bc/C/rpc";
const ARBITRUM_RINKEBY_RPC = "https://rinkeby.arbitrum.io/rpc";
const ARBITRUM_RPC = "https://arb1.arbitrum.io/rpc";
const HARMONY_RPC = "https://api.s0.t.hmny.io";
const HARMONY_TESTNET_RPC = "https://api.s0.pops.one";
const OPTIMISM_KOVAN = "https://kovan.optimism.io";
const OPTIMISM_RPC = "https://mainnet.optimism.io";
const FANTOM_TESTNET_RPC = "https://rpc.testnet.fantom.network";
const FANTOM_RPC = "https://rpc.ftm.tools";

const markets = [
  {
    name: "AaveV2Kovan",
    rpc: KOVAN_RPC,
    addressProvider: "0x88757f2f99175387ab4c6a4b3067c77a695b0349",
    version: 2,
  },
  {
    name: "AaveV3Rinkeby",
    rpc: RINKEBY_RPC,
    addressProvider: "0xBA6378f1c1D046e9EB0F538560BA7558546edF3C",
    version: 3,
  },
  {
    name: "AaveV2Eth",
    rpc: MAINNET_RPC,
    addressProvider: "0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5",
    version: 2,
  },
  {
    name: "AaveV2KovanAMM",
    rpc: KOVAN_RPC,
    addressProvider: "0x67FB118A780fD740C8936511947cC4bE7bb7730c",
    version: 2,
  },
  {
    name: "AaveV2EthAMM",
    rpc: MAINNET_RPC,
    addressProvider: "0xacc030ef66f9dfeae9cbb0cd1b25654b82cfa8d5",
    version: 2,
  },
  {
    name: "AaveV2Mumbai",
    rpc: MUMBAI_RPC,
    addressProvider: "0x178113104fEcbcD7fF8669a0150721e231F0FD4B",
    version: 2,
  },
  {
    name: "AaveV3Mumbai",
    rpc: MUMBAI_RPC,
    addressProvider: "0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6",
    version: 3,
  },
  {
    name: "AaveV2Polygon",
    rpc: POLYGON_RPC,
    addressProvider: "0xd05e3E715d945B59290df0ae8eF85c1BdB684744",
    version: 2,
  },
  {
    name: "AaveV3Polygon",
    rpc: POLYGON_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV2Fuji",
    rpc: FUJI_RPC,
    addressProvider: "0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f",
    version: 2,
  },
  {
    name: "AaveV3Fuji",
    rpc: FUJI_RPC,
    addressProvider: "0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29",
    version: 3,
  },
  {
    name: "AaveV2Avalanche",
    rpc: AVALANCHE_RPC,
    addressProvider: "0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f",
    version: 2,
  },
  {
    name: "AaveV3Avalanche",
    rpc: AVALANCHE_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3ArbitrumRinkeby",
    rpc: ARBITRUM_RINKEBY_RPC,
    addressProvider: "0xF7158D1412Bdc8EAfc6BF97DB4e2178379c9521c",
    version: 3,
  },
  {
    name: "AaveV3Arbitrum",
    rpc: ARBITRUM_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3FantomTestnet",
    rpc: FANTOM_TESTNET_RPC,
    addressProvider: "0xE339D30cBa24C70dCCb82B234589E3C83249e658",
    version: 3,
  },
  {
    name: "AaveV3Fantom",
    rpc: FANTOM_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3HarmonyTestnet",
    rpc: HARMONY_TESTNET_RPC,
    addressProvider: "0xd19443202328A66875a51560c28276868B8C61C2",
    version: 3,
  },
  {
    name: "AaveV3Harmony",
    rpc: HARMONY_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3OptimismKovan",
    rpc: OPTIMISM_KOVAN,
    addressProvider: "0xD15d36975A0200D11B8a8964F4F267982D2a1cFe",
    version: 3,
  },
  {
    name: "AaveV3Optimism",
    rpc: OPTIMISM_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
];

async function generateMarketV2(market) {
  const provider = new ethers.providers.StaticJsonRpcProvider(market.rpc);
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider = ethers.utils.getAddress(market.addressProvider);
  const contract = new ethers.Contract(
    addressProvider,
    addressProviderV2ABI,
    provider
  );
  try {
    const lendingPool = await contract.getLendingPool();
    const lendingPoolConfigurator = await contract.getLendingPoolConfigurator();
    const oracle = await contract.getPriceOracle();
    const admin = await contract.owner();
    const emergencyAdmin = await contract.getEmergencyAdmin();
    const templateV2 = `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";


library ${market.name} {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            ${addressProvider}
        );

    ILendingPool internal constant POOL =
        ILendingPool(${lendingPool});

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(${lendingPoolConfigurator});

    IAaveOracle internal constant ORACLE =
        IAaveOracle(${oracle});

    address internal constant POOL_ADMIN =
        ${admin};

    address internal constant EMERGENCY_ADMIN =
        ${emergencyAdmin};
}\r\n`;
    fs.writeFileSync(`./src/libs/${market.name}.sol`, templateV2);

    // Append the market to the addressBook
    fs.appendFileSync(`./src/AaveAddressBook.sol`, `import {${market.name}} from "../libs/${market.name}.sol"\r\n`);

    // Create the test for the specified market
    const testTemplateV2 = `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {${market.name}} from "../libs/${market.name}.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testFailPoolAddressProviderIs0Address() public {
        assertEq(address(${market.name}.POOL_ADDRESSES_PROVIDER), address(0));
    }

    function testFailPoolAddressIs0Address() public {
        assertEq(address(${market.name}.POOL), address(0));
    }

    function testFailPoolConfiguratorIs0Address() public {
        assertEq(address(${market.name}.POOL_CONFIGURATOR), address(0));
    }

    function testFailOracleIs0Address() public {
        assertEq(address(${market.name}.ORACLE), address(0));
    }

    function testFailPoolAdminIs0Address() public {
        assertEq(${market.name}.POOL_ADMIN, address(0));
    }

    function testFailEmergencyAdminIs0Address() public {
        assertEq(${market.name}.EMERGENCY_ADMIN, address(0));
    }
}\r\n`
    fs.writeFileSync(`./src/test/${market.name}.t.sol`, testTemplateV2);
  } catch (error) {
    throw new Error(JSON.stringify({message: error.message, market, stack: error.stack}));
  }
}

async function generateMarketV3(market) {
  const provider = new ethers.providers.StaticJsonRpcProvider(market.rpc);
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider = ethers.utils.getAddress(market.addressProvider);
  const contract = new ethers.Contract(
    addressProvider,
    addressProviderV3ABI,
    provider
  );
  try {
    const pool = await contract.getPool();
    const poolConfigurator = await contract.getPoolConfigurator();
    const oracle = await contract.getPriceOracle();
    const admin = await contract.owner();
    const aclAdmin = await contract.getACLAdmin();

    const templateV3 = `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";


library ${market.name} {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            ${addressProvider}
        );

    IPool internal constant POOL =
        IPool(${pool});

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(${poolConfigurator});

    IAaveOracle internal constant ORACLE =
        IAaveOracle(${oracle});

    address internal constant POOL_ADMIN =
        ${admin};

    address internal constant ACL_ADMIN =
        ${aclAdmin};
}\r\n`;
    fs.writeFileSync(`./src/libs/${market.name}.sol`, templateV3);

    // Append the market to the addressBook
    fs.appendFileSync(`./src/AaveAddressBook.sol`, `import {${market.name}} from "../libs/${market.name}.sol"\r\n`);

    // Create the test for the specified market
    const testTemplateV3 = `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {${market.name}} from "../libs/${market.name}.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testFailPoolAddressProviderIs0Address() public {
        assertEq(address(${market.name}.POOL_ADDRESSES_PROVIDER), address(0));
    }

    function testFailPoolAddressIs0Address() public {
        assertEq(address(${market.name}.POOL), address(0));
    }

    function testFailPoolConfiguratorIs0Address() public {
        assertEq(address(${market.name}.POOL_CONFIGURATOR), address(0));
    }

    function testFailOracleIs0Address() public {
        assertEq(address(${market.name}.ORACLE), address(0));
    }

    function testFailPoolAdminIs0Address() public {
        assertEq(${market.name}.POOL_ADMIN, address(0));
    }

    function testFailACLAdminIs0Address() public {
        assertEq(${market.name}.ACL_ADMIN, address(0));
    }
}\r\n`
    fs.writeFileSync(`./src/test/${market.name}.t.sol`, testTemplateV3);
  } catch (error) {
    throw new Error(JSON.stringify({message: error.message, market, stack: error.stack}));
  }
}

async function generateMarkets() {
  // Create the test for the specified market
  const AaveAddressBookTemplate = `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
\r\n`
      fs.writeFileSync(`./src/AaveAddressBook.sol`, AaveAddressBookTemplate);
  const generatedMarkets = await Promise.allSettled(
    markets.map((market) => market.version === 2 ? generateMarketV2(market) : generateMarketV3(market))
  );

  const failedMarkets = generatedMarkets.filter(promise => promise.status === 'rejected');

  if (failedMarkets.length > 0) {
    failedMarkets.forEach(failedMarket => {
      const error = JSON.parse(failedMarket.reason.message);
      console.log(`
        Could not generate market for:
        - market: ${error.market.name}
        - market version: ${error.market.version}
        - network rpc: ${error.market.rpc}
        - trace: ${error.stack}
      `);
    })

    throw new Error('Some markets where not properly generated');
  }
}

generateMarkets().then(() => {
  console.log("markets successfully generated")
  process.exit(0);
}).catch((error) => {
  console.log(error);
  process.exit(1);
});
