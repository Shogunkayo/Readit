'use client'

import Link from "next/link"
import { useEffect, useState } from "react"
import {AiOutlineArrowUp, AiOutlineSearch} from "react-icons/ai"
import { usePathname, useRouter } from "next/navigation"
import SearchBar from "./SearchBar"
import { useSelector } from "react-redux"
import { RootState } from "../redux/store"

type Props = {}

const Topbar = (props: Props) => {
    const auth = useSelector((state: RootState) => state.auth)
    const currentUrl = usePathname()
    const router = useRouter()

    const [opacity, setOpacity] = useState(1)
    const [searchOpen, setSearchOpen] = useState(false)

    useEffect(() => {
        const handleScroll = () => {
            if (window.scrollY > 0) {
                setOpacity(0.4)
            }
            else {
                setOpacity(1)
            }
        }

        window.addEventListener('scroll', handleScroll)

        return () => {
            window.removeEventListener('scroll', handleScroll)
        }
    }, [])
   

    const scrollToDiv = async (id: string) => {
        const element = document.getElementById(id);
        const navbar = document.getElementById("topbar")

        if (element && navbar) {
            const navbarHeight = navbar.getBoundingClientRect().height;
            const targetScrollPosition = element.getBoundingClientRect().top + window.scrollY - navbarHeight - 50

            window.scrollTo({top: targetScrollPosition, behavior: 'smooth'})
            
        }
    }

    return (
        <nav id="topbar" className={`flex items-center justify-between div-component bg-background p-1 sticky top-0 z-40 shadow-xl transition-all duration-300`} style={{ background: `rgba(255, 255, 255, ${opacity})`, backdropFilter: 'blur(5px)'}}>
            <div className="flex">
                <Link href="/">
                    <h1 className="text-gradient text-3xl font-heading">Readit</h1>
                </Link>
                <div className="mx-10">
                    {currentUrl === "/" && (
                        <>
                            <button className="button-pink" onClick={() => scrollToDiv("trending")}>Trending</button>
                            <button className="button-pink" onClick={() => scrollToDiv("explore")}>Explore</button>
                        </>
                    )}
                </div>
            </div>
            <div className="absolute w-1/2 right-[29.5rem] z-30">
                {searchOpen && (
                    <SearchBar></SearchBar>
                )}
                {!searchOpen && (
                    <div className="translate-x-[27.5rem] w-fit">
                       <button className="button-pink" onClick={() => setSearchOpen(true)}><AiOutlineSearch></AiOutlineSearch></button> 
                    </div>
                )}
            </div>
            <div>
                {!auth.user && (
                    <> 
                        <button className="button-black" onClick={() => {router.push("/login")}}>Login</button> 
                        <button className="button-black" onClick={() => {router.push("/signup")}}>Signup</button>
                    </>
                )}
                {auth.user && (
                    <>
                        <button></button>
                    </>
                )}
            </div>
            {window.scrollY > 0 && (
                <div className="fixed z-50 top-[56rem] right-5">
                    <button className="bg-text text-secondary hover:text-background hover:bg-primary" onClick={() => scrollToDiv("main")}><AiOutlineArrowUp></AiOutlineArrowUp></button>
                </div>
            )}
        </nav>
    )
}

export default Topbar
