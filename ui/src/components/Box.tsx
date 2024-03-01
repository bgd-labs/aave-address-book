import { cn } from '@/utils/cn';

type Props = {
  children: React.ReactNode;
  attachToTop?: boolean;
  className?: string;
  isHoverable?: boolean;
  type?: 'danger' | 'warning' | 'success';
};

export const Box = ({ children, isHoverable, className, type }: Props) => {
  return (
    <div className={cn('group/box relative block')}>
      <span className="absolute left-0 top-0 h-full w-full">
        <span
          className={cn(
            'will-change[transform] ease-cubic-bezier[.3,.7,.4,1] absolute bottom-0 left-0 h-full w-2 origin-left -translate-x-2 translate-y-2 skew-y-[-45deg] border border-b-0 border-r-0 border-brand-900 bg-brand-500 transition-transform group-last/box:border-b',
            {
              ['bg-red-300']: type === 'danger',
              ['bg-yellow-300']: type === 'warning',
              ['bg-green-300']: type === 'success',
              ['group-hover/box:scale-x-150 group-hover/box:border-l-[0.5px] group-active/box:scale-100 group-active/box:border-l group-focus-within/box:scale-x-150 group-focus-within/box:border-l-[0.5px]']:
                isHoverable,
            },
          )}
        />
        <span
          className={cn(
            'will-change[transform] ease-cubic-bezier[.3,.7,.4,1] absolute bottom-0 left-0 h-2 w-full origin-bottom -translate-x-2 translate-y-2 skew-x-[-45deg] border border-l-0 border-t-0 border-brand-900 bg-brand-300 transition-transform',
            {
              ['group-hover/box:scale-y-150 group-hover/box:border-b-[0.5px] group-hover/box:border-l group-hover/box:border-t-[0.5px] group-hover/box:bg-brand-300 group-last/box:group-hover/box:border-l-0 group-last/box:group-hover/box:border-t-0 group-active/box:scale-100 group-active/box:border-b group-focus-within/box:scale-y-150 group-focus-within/box:border-b-[0.5px] group-focus-within/box:border-l group-focus-within/box:border-t-[0.5px] group-focus-within/box:bg-brand-300']:
                isHoverable,
            },
          )}
        />
      </span>
      <span
        className={cn(
          'will-change[transform] ease-cubic-bezier[.3,.7,.4,1] relative block border border-b-0 border-brand-500 border-l-brand-900 border-r-brand-900 bg-white transition-transform group-last/box:border-b',
          className,
          {
            ['bg-red-50']: type === 'danger',
            ['border-yellow-600 bg-yellow-50']: type === 'warning',
            ['border-green-600 bg-green-50']: type === 'success',
            ['group-hover/box:-translate-y-1 group-hover/box:translate-x-1 group-hover/box:border-brand-900 group-focus-within/box:-translate-y-1 group-focus-within/box:translate-x-1 group-focus-within/box:border-brand-900 group-active/box:translate-x-0 group-active/box:translate-y-0']:
              isHoverable,
          },
        )}
      >
        {children}
      </span>
    </div>
  );
};
