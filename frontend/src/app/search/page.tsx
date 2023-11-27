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
    const [nationality, setNationality] = useState('');
    const [conferenceTier, setConferenceTier] = useState('');
    const [domain, setDomain] = useState('');


    const handleSearch = () => {
        console.log(nationality, conferenceTier, domain)
    }

    useEffect(() => {
        axios.get(`http://localhost:5000/search?s=${searchKey}`)
            .then(async response => {
                if(!response.data)
                    console.log("error getting data")
                setSearchResult(response.data)
            })
    }, [searchKey])

    return (
        <div className="flex">
            <div className="flex-none w-3/4">
                <div className="div-component bg-background">
                    <button onClick={() => setView("paper")} className="button-pink">Publication</button>
                    <button onClick={() => setView("user")} className="button-pink">Researcher</button>
                    <button onClick={() => setView("user")} className="button-pink">Conference</button>
                    <button onClick={() => setView("user")} className="button-pink">Organization</button>
                    <button onClick={() => setView("user")} className="button-pink">University</button>
                    <button onClick={() => setView("user")} className="button-pink">Company</button>
                </div>
                <div className="div-component bg-secondary min-h-[50rem]">
                    {view == "paper" && (
                        <div>
                            {searchResult["papers"] !== null && searchResult["papers"].map((paper, idx) => (
                                <div key={idx} className="bg-background relative p-4 m-2 rounded-3xl">
                                    <h2 className="text-2xl text-primary">{paper["title"]}</h2>
                                    <h3>{paper["conf_name"]}</h3>
                                    <button className="absolute right-5 top-3 bg-primary text-background">{paper["domain"]}</button>
                                    <h3>{paper["first_name"]} {paper["last_name"]}</h3>
                                </div>
                            ))}
                        </div>
                    )} 
                    {view == "user" && (
                        <div>
                            {searchResult["users"] !== null && searchResult["users"].map((user, idx) => (
                                <div key={idx} onClick={() => router.push(`/profile/${user["r_id"]}`)} className="bg-background p-4 m-2 rounded-3xl cursor-pointer">
                                    <h3 className="text-2xl text-primary">{user["first_name"]} {user["last_name"]}</h3>
                                </div>
                            ))}
                        </div>
                    )}
                </div>
            </div>
            <div className="div-component bg-primary flex-auto max-h-[40rem]">
                <h2 className="text-3xl text-background text-center">Filter Results</h2>
                <label className="text-background block mb-1 mt-2">Nationality:</label>
                <select name="country" className="w-full p-3 border rounded-xl outline-none border-none mt-1 focus:outline-none focus:border-accent bg-background">
                    <option value="India">India 🇮🇳</option>
                    <option value="USA">United States of America 🇺🇸</option>
                    <option value="Germany">Germany 🇩🇪</option>
                    <option value="Canada">Canada 🇨🇦</option>
                    <option value="Australia">Australia 🇦🇺</option>
                    <option value="Japan">Japan 🇯🇵</option>
                    <option value="Brazil">Brazil 🇧🇷</option>
                    <option value="South Africa">South Africa 🇿🇦</option>
                    <option value="United Kingdom">United Kingdom 🇬🇧</option>
                </select>
                <label className="text-background block mt-2 mb-1"> Conference Tier: </label>
                <select name="country" className="w-full p-3 border rounded-xl outline-none border-none mt-1 focus:outline-none focus:border-accent bg-background">
                    <option value="India">Tier 1</option>
                    <option value="USA">Tier 2</option>
                    <option value="Germany">Tier 3</option>
                    <option value="Canada">Other</option>
                </select>
                <label className="text-background block mt-2 mb-1"> Company Type: </label>
                <select name="country" className="w-full p-3 border rounded-xl outline-none border-none mt-1 focus:outline-none focus:border-accent bg-background">
                    <option value="India">NGO</option>
                    <option value="USA">For Profit</option>
                    <option value="Canada">Other</option>
                </select>
                <label className="text-background mb-1 mt-2 block">Domain:</label>
                <input type="text" value={domain} onChange={(e) => setDomain(e.target.value)} className="w-full p-2 rounded-xl mt-1"/>
                <label className="text-background mb-1 mt-2 block">Conference Location:</label>
                <input type="text" value={domain} onChange={(e) => setDomain(e.target.value)} className="w-full p-2 rounded-xl mt-1"/>
                <div className="flex justify-center">
                    <button onClick={handleSearch} className="button-primary w-1/4 mx-auto my-10">Apply</button> 
                    <button onClick={handleSearch} className="button-primary w-1/4 mx-auto my-10">Clear</button> 
                </div>
            </div>
        </div>
    )
}

export default Search
