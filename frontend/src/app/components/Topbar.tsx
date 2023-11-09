import Link from "next/link"

type Props = {}

const Topbar = (props: Props) => {
    return (
        <nav className="flex items-center justify-between div-component bg-background p-2 sticky">
            <div className="flex">
                <Link href="/">
                    <h1 className="text-primary text-2xl font-accent translate-y-1">Readit</h1>
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
