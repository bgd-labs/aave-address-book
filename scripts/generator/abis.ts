import {ABI_INTERFACES} from '../configs/abis';

export function generateABIImports() {
  const jsExports: string[] = [];
  for (const INTERFACE of ABI_INTERFACES) {
    const varName = `${INTERFACE}_ABI`;
    jsExports.push(`export {${varName}} from './scripts/abis/${INTERFACE}';`);
  }
  return {
    solidity: [],
    js: jsExports,
  };
}
