export type SearchItem = {
  path: string[];
  value: string;
  chainId: number | null;
  link: string;
  searchPath: string;
  // always the root entry point
  library: string;
  // always the explicit key of the value
  key: string;
};
