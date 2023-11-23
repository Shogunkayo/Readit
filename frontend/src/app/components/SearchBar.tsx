'use client'

import { useRouter } from "next/navigation"
import { useState } from "react"

type Props = {}

const SearchBar = (props: Props) => {
    const [searchInput, setSearchInput] = useState('')
    const router = useRouter()

    const handleInputChange = (e) => {
        setSearchInput(e.target.value)
    }

    const handleSubmit = () => {
        if (searchInput === '')
            return
        router.push(`/search?s=${searchInput}`)
    }

    return (
        <div>
            <div className="relative w-1/2 m-auto my-10">
                <input name="search"
                    placeholder="Search papers, authors, conferences, institutes..."
                    className="bg-background h-12 px-5 pr-10 rounded-full text-md w-full focus:outline-none"
                    value={searchInput}
                    onChange={handleInputChange}/>
                <button
                    className="absolute text-secondary bg-text button-circle" 
                    style={{'top': -5, 'right':-15}}
                    onClick={handleSubmit}
                >&gt;</button>
            </div>
        </div>
    )
}

export default SearchBar
