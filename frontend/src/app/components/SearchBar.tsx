import React from 'react'

type Props = {}

const SearchBar = (props: Props) => {
    return (
        <div>
            <div className="relative w-1/2 m-auto my-10">
                <input name="search" placeholder="Search papers, authors, conferences, institutes..." className="bg-background h-12 px-5 pr-10 rounded-full text-md w-full focus:outline-none"/>
                <button type="submit" className="absolute text-secondary bg-text button-circle" style={{'top': -5, 'right':-15}}>&gt;</button>
            </div>
        </div>
    )
}

export default SearchBar
