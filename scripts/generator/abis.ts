import {ABI_INTERFACES, DOWNLOAD_ABI_INTERFACES} from '../configs/abis';

export function generateABIImports() {
  const jsExports: string[] = [];
  for (const INTERFACE of ABI_INTERFACES) {
    const varName = `${INTERFACE}_ABI`;
    jsExports.push(`export {${varName}} from './abis/${INTERFACE}';`);
  }
  for (const INTERFACE of DOWNLOAD_ABI_INTERFACES) {
    const varName = `${INTERFACE.name}_ABI`;
    jsExports.push(`export {${varName}} from './abis/${INTERFACE.name}';`);
  }
  return {
    solidity: [],
    js: jsExports,
  };
}
