import { Box } from './Box';

export const SearchSkeleton = () => {
  return (
    <div className="w-full max-w-2xl mb-10">
      <Box className="group border-brand-900 border p-1.5">
        <svg
          className="w-7 h-7 group-focus-within:text-brand-900 absolute top-1/2 left-3 -translate-y-1/2 text-brand-500 transition-all"
          fill="none"
          viewBox="0 0 24 24"
        >
          <path
            stroke="currentColor"
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="1.5"
            d="M19.25 19.25L15.5 15.5M4.75 11C4.75 7.54822 7.54822 4.75 11 4.75C14.4518 4.75 17.25 7.54822 17.25 11C17.25 14.4518 14.4518 17.25 11 17.25C7.54822 17.25 4.75 14.4518 4.75 11Z"
          ></path>
        </svg>
        <div className='py-3 px-11 w-full text-xl border border-transparent'>&nbsp;</div>
      </Box>
    </div>
  );
};
