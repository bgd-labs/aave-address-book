import type { Metadata } from 'next';
import { Inter, Space_Grotesk } from 'next/font/google';
import { Footer } from '@/components/Footer';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-sans' });
const spaceGrotesk = Space_Grotesk({
  subsets: ['latin'],
  variable: '--font-heading',
});

export const metadata: Metadata = {
  metadataBase: new URL('https://search.onaave.com'),
  title: 'Search on Aave',
  description: "Registry of all smart contracts' addresses on Aave",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`font-sans ${inter.variable} ${spaceGrotesk.variable} bg-[url('/backgroundPattern.svg')] bg-no-repeat bg-cover bg-fixed`}
      >
        {children}
      </body>
    </html>
  );
}
