import twitterIcon from '@/assets/icons/twitter.svg';
import websiteIcon from '@/assets/icons/website.svg';
import Image from 'next/image';
import githubIcon from '@/assets/icons/github.svg';

export const Footer = () => {
  return (
    <div className="mt-auto -translate-x-1">
      <div className="flex items-center justify-center text-sm text-brand-500">
        <div>
          <div className="mb-2 text-center">by BGD Labs</div>
          <div className="flex justify-center gap-1">
            <a
              href="https://twitter.com/bgdlabs"
              target="_blank"
              rel="noreferrer"
            >
              <Image
                src={twitterIcon}
                className="h-6 w-6"
                alt="BGD Labs Official X Account"
              />
            </a>
            <a href="https://bgdlabs.com/" target="_blank" rel="noreferrer">
              <Image
                src={websiteIcon}
                className="h-6 w-6"
                alt="BGD Labs Website"
              />
            </a>
            <a href="https://github.com/bgd-labs/aave-address-book" target="_blank" rel="noreferrer">
              <Image
                src={githubIcon}
                className="h-6 w-6"
                alt="Aave-address-book GitHub Repository"
              />
            </a>
          </div>
        </div>
      </div>
    </div>
  );
};
