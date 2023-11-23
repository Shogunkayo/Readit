'use client'

import { useRouter, useSearchParams } from "next/navigation"
import { useEffect, useState } from "react"
import axios from "axios"

interface SearchResult {
    papers: []
    users: []
}

const Search = () => {
    const searchParams = useSearchParams()
    const searchKey = searchParams.get('s')
    const [searchResult, setSearchResult] = useState<SearchResult>({"papers": [], "users": []})
    const [view, setView] = useState("paper")
    const router = useRouter()

    useEffect(() => {
        axios.get(`http://localhost:5000/search?s=${searchKey}`)
            .then(async response => {
                if(!response.data)
                    console.log("error getting data")
                setSearchResult(response.data)
            })
    }, [searchKey])

    return (
        <div className="div-component bg-secondary">
            <div>
                <button onClick={() => setView("paper")}>Paper</button>
                <button onClick={() => setView("user")}>User</button>
            </div>
            <div>
                {view == "paper" && (
                    <div>
                        {searchResult["papers"] !== null && searchResult["papers"].map((paper, idx) => (
                            <div key={idx}>
                                <h2>{paper["title"]}</h2>
                                <p>{paper["domain"]}</p>
                                <h3>{paper["last_name"]}, {paper["first_name"]}</h3>
                            </div>
                        ))}
                    </div>
                )} 
                {view == "user" && (
                    <div>
                        {searchResult["users"] !== null && searchResult["users"].map((user, idx) => (
                            <div key={idx} onClick={() => router.push(`/profile/${user["r_id"]}`)}>
                                <h3>{user["last_name"]}, {user["first_name"]}</h3>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    )
}

export default Search
