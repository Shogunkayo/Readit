'use client'

import Link from "next/link"
import { useEffect, useState } from "react"

type Props = {}

const Topbar = (props: Props) => {

    const [opacity, setOpacity] = useState(1);

    useEffect(() => {
        const handleScroll = () => {
            if (window.scrollY > 0) {
                setOpacity(0.4);
            }
            else {
                setOpacity(1);
            }
        }

        window.addEventListener('scroll', handleScroll);

        return () => {
            window.removeEventListener('scroll', handleScroll)
        }
    })
    

    return (
        <nav className={`flex items-center justify-between div-component bg-background p-1 sticky top-0 z-50 shadow-xl transition-all duration-300`} style={{ background: `rgba(255, 255, 255, ${opacity})`, backdropFilter: 'blur(5px)'}}>
            <div className="flex">
                <Link href="/">
                    <h1 className="text-gradient text-3xl font-heading translate-y-1">Readit</h1>
                </Link>
                <div className="mx-10">
                    <button className="button-pink">Trending</button>
                    <button className="button-pink">Explore</button>
                </div>
            </div>
            <div>
                <button className="button-black">Login</button> 
                <button className="button-black">Signup</button>
            </div>
        </nav>
    )
}

export default Topbar
