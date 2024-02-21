import type { Metadata } from "next";
import { Inter, Space_Grotesk } from "next/font/google";
import { Footer } from "@/components/Footer";
import "./globals.css";

const inter = Inter({ subsets: ["latin"], variable: "--font-sans", });
const spaceGrotesk = Space_Grotesk({ subsets: ["latin"], variable: "--font-heading",});

export const metadata: Metadata = {
  title: "Aave Address Book",
  description: "Aave Address Book by BGD labs",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`font-sans ${inter.variable} ${spaceGrotesk.variable} bg-[url('/backgroundPattern.svg')] bg-no-repeat bg-cover bg-fixed`}>
        {children}
      </body>
    </html> 
  );
}
