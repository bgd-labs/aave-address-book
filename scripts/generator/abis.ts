import {ABI_INTERFACES, DOWNLOAD_ABI_INTERFACES} from '../configs/abis';

export function generateABIImports() {
  const jsExports: string[] = [];
  for (const INTERFACE_PATH of ABI_INTERFACES) {
    const INTERFACE =
      INTERFACE_PATH.split(':').length > 1 ? INTERFACE_PATH.split(':')[1] : INTERFACE_PATH;
    const varName = `${INTERFACE}_ABI`;
    jsExports.push(`export {${varName}} from './${INTERFACE}';`);
  }
  for (const INTERFACE of DOWNLOAD_ABI_INTERFACES) {
    const varName = `${INTERFACE.name}_ABI`;
    jsExports.push(`export {${varName}} from './${INTERFACE.name}';`);
  }
  return jsExports;
}
