import {ABI_INTERFACES, DOWNLOAD_ABI_INTERFACES, resolveAbiInterface} from 'scripts/configs/abis';

export function generateABIImports() {
  const jsExports: string[] = [];
  for (const ENTRY of ABI_INTERFACES) {
    const {name} = resolveAbiInterface(ENTRY);
    jsExports.push(`export {${name}_ABI} from './${name}';`);
  }
  for (const INTERFACE of DOWNLOAD_ABI_INTERFACES) {
    const varName = `${INTERFACE.name}_ABI`;
    jsExports.push(`export {${varName}} from './${INTERFACE.name}';`);
  }
  return jsExports;
}
