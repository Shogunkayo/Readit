import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'
import { Providers } from './redux/provider'
import Topbar from './components/Topbar'
import Footer from './components/Footer'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
    title: 'Readit',
    description: 'Connecting Scientists and Researchers Globally',
}

export default function RootLayout({ children, }: { children: React.ReactNode}) {
    return (
        <html lang="en">
            <body className={inter.className}>
                <Providers>
                    <Topbar></Topbar>
                    {children}
                    <Footer></Footer>
                </Providers>
            </body>
        </html>
    )
}
